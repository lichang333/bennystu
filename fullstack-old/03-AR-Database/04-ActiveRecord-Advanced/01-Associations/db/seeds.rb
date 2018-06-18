# TODO: Write a seed
require 'faker'
5.times do
  user = User.create(username: Faker::Name.name, email: Faker::Internet.email)
  rand(5..10).times do
    post = Post.create(name: Faker::FunnyName.name, url: Faker::Internet.url, votes: rand(1..100), user_id: user.id)
  end
end
