require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    @view.all(Post.all)
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
  end

  def create
    title = @view.ask("title")
    url = @view.ask("url")
    Post.new(title: title, url: url, votes: 0).save
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
  end

  def update
    index
    id = @view.ask("id")
    title = @view.ask("new title")
    url = @view.ask("new url")
    Post.find(id).update(title: title, url: url)
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
  end

  def destroy
    index
    id = @view.ask("id")
    Post.find(id).destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
  end

  def upvote
    index
    id = @view.ask("id")
    post = Post.find(id)
    post.update(votes: post.votes + 1)
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
  end
end
