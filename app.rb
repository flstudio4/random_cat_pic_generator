require "sinatra"
require "sinatra/reloader"
require "net/http"
require "json"

get("/") do
  erb(:main)
end

post("/generate") do
  url = URI("https://api.thecatapi.com/v1/images/search")
  raw_data = Net::HTTP.get(url)
  parsed_data = JSON.parse(raw_data)
  @pic_url = parsed_data[0].fetch("url").to_s
  erb(:generate)
end
