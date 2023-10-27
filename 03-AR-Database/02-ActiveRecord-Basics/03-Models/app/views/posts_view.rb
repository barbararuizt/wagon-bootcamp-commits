class PostsView
  def all(posts)
    posts.each do |post|
      puts "#{post.id} - #{post.title} - #{post.url} - #{post.votes}"
    end
  end

  def ask(thing)
    puts "What is the #{thing}?"
    gets.chomp
  end
  # TODO: implement some methods here when controller needs to `puts` or `gets`
end
