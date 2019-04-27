require "kemal"
require "../src/validate"

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

Kemal.run
