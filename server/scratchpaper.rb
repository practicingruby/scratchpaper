require "slim"
require "sinatra"
require "sinatra/reloader"
require "pstore"
require "json"

def store
  @store ||= PStore.new("log.store")
end

get "/:key" do
  raise if params['key'].nil?

  store.transaction { 
    @data = store[params['key']].reverse
  }

  slim :log
end

post "/:key" do
  store.transaction do
    store[params['key']] ||= [] 
    store[params['key']] << JSON.parse(params[:data])
  end

  "ok"
end

__END__

@@log
.container
  br
  br
  .row
  .col-md-2
  .col-md-8
    - @data.each do |e|
      - case e[0]
      - when "text"
        .panel.panel-default
          .panel-body
            = e[1]
      - when "list"
        .panel.panel-default
          ul.list-group
          - e[1].each do |x|
            li.list-group-item= x
      - when "table"
        table.table.table-bordered
          - e[1].each do |row|
            tr
              - row.each do |cell|
                td= cell
      - else
        - raise NotImplementedError
      br

@@layout 
doctype html 
html
  head
    link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
    link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"
  body 
    == yield 
  javascript:
    setTimeout(function() { window.location.reload(1) }, 500);
    