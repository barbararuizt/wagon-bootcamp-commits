require "faker"

100.times do
  Post.create(title: Faker::Quotes::Shakespeare.as_you_like_it_quote, url: Faker::Internet.url, votes: rand(1..1000))
end
# TODO: Write a seed to insert 100 posts in the database
