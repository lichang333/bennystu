require_relative "../app/models/post"
require "faker"

# TODO: Write a seed to insert 100 posts in the database
100.times do
  post = Post.new(title: Faker::HeyArnold.character, url: Faker::Internet.url, votes: rand(1..5))
  post.save
end
