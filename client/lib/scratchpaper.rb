require "restclient"
require "json"

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