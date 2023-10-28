# TODO: Write a seed
require 'faker'

5.times do
  name = Faker::Artist.name
  User.create(username: name, email: "#{name.downcase.gsub(' ', '_')}@live.com")
end

User.all.each do |user|
  num = rand(5..10)
  num.times do
    Post.create(title: Faker::Verb.ing_form, url: Faker::Internet.url, user_id: user.id)
  end
end
