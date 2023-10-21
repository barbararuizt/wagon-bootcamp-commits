# You can use a global variable, DB, which is an instance of SQLite3::Database
# No need to create it, you can just use it!

class Post
  attr_accessor :title, :url
  attr_reader :id, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.find(identificator)
    # TODO: Write the SQL query to get the post with the given id
    result = DB.execute("SELECT * FROM posts WHERE id = ?", identificator)
    result.flatten!
    result = { id: result[0], title: result[1], url: result[2], votes: result[3] }
    result[:title].nil? ? nil : Post.new(result)
    # TODO: Use DB.execute to execute the SQL query
    # TODO: Return the post found - as an instance of a Post!
  end

  def self.all
    all = []
    results = DB.execute("SELECT * FROM posts")
    results.each do |post|
      result = { id: post[0], title: post[1], url: post[2], votes: post[3] }
      all << Post.new(result)
    end
    all
  end
end
