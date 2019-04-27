require "kemal"

get "/" do |env|
  env.params.url["name"] = "guest"
  name = env.params.url["name"]
  render "src/views/index.ecr"
end

get "/:name" do |env|
  name = env.params.url["name"]
  puts name.class
  puts name
  render "src/views/index.ecr"
end

Kemal.run
