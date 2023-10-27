require "json"
require "rest-client"

response = RestClient.get 'https://hacker-news.firebaseio.com/v0/topstories.json'
top_stories = JSON.parse(response.body)
top_10_stories = top_stories[0..9]

top_10_stories.each do |id|
  response = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
  story = JSON.parse(response.body)
  Post.create(title: story["title"], url: story["url"], votes: story["score"])
end
# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
