require "restclient"
require "json"

def spit(type, message)
  RestClient.post("http://#{ENV["SPIT_URL"]}/#{ENV["SPIT_KEY"]}",
                  :data => [type, message].to_json)

  :ok
end

def sp(data)
  spit("text", data)
end

def st(data)
  spit("table", data)
end

def sl(data)
  spit("list", data)
end