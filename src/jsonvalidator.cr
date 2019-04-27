require "kemal"
require "../src/validate"
Kemal.config.port = 1502
host = Kemal.config.host_binding
err_msg = ""

get "/" do |env|
  env.params.url["name"] = "guest"
  name = env.params.url["name"]
  render "src/views/index.ecr"
end

get "/:name" do |env|
  name = env.params.url["name"]
  render "src/views/index.ecr"
end

post "/json_validate" do |env|
  str = env.params.body["jsonObj"].as(String)
  valid_flag, err_msg = validate(str)
  puts err_msg
  render "src/views/json.ecr"
end

get "/v" do |env|
  version = "0.1.0"
end

Kemal.run
