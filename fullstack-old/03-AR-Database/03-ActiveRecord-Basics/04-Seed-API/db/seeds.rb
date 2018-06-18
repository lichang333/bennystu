require "json"
require "rest-client"


response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
posts = JSON.parse(response).first(10)
posts.each do |post|
  reply = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{post}.json"
  post = JSON.parse(reply)
  p = Post.new(title: post[:title], url: post[:url], votes: post[:score])
  p.save
end

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
