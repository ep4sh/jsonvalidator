require "kemal"
require "../src/validate"
Kemal.config.port = 1502
host = Kemal.config.host_binding
err_msg = ""
version = "0.1.0"
valid_flag = ""
exist_flag = 0

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
  exist_flag = 1
  puts err_msg
  render "src/views/json.ecr"
end

post "/a" do |env|
  str = env.params.body["jsonObj"].as(String)
  render "src/views/index.ecr"
end

get "/v" do |env|
  version
end

Kemal.run
