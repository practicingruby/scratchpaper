require "restclient"
require "json"

module ScratchPaper
  module_function

  def scratch_note(type, message)
    RestClient.post("http://#{ENV["SCRATCHPAPER_URL"]}/#{ENV["SCRATCHPAPER_KEY"]}",
                    :data => [type, message].to_json)

    :ok
  end

  def sp(data)
    scratch_note("text", data)
  end

  def st(data)
    scratch_note("table", data)
  end

  def sl(data)
    scratch_note("list", data)
  end

  def sr(data)
    case data
    when ActiveRecord::Relation
      st(data.map { |r| r.attributes.to_a })
    when ActiveRecord::Base
      st(r.attributes.to_a)
    end
  end
end