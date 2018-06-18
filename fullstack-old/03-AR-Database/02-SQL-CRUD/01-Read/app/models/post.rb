# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

require "sqlite3"
DB = SQLite3::Database.new("a_file.db")
# DB.execute("CREATE TABLE `posts` (
#   `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
#   `title` TEXT,
#   `url` TEXT,
#   `votes`  INTEGER
# )")

class Post
  # TODO
  attr_reader :id
  attr_accessor :title, :url, :votes
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.find(id)
    found_posts = DB.execute("SELECT * FROM posts WHERE id = ?", id).flatten
    if found_posts.empty?
      nil
    else
      new(id: found_posts[0], title: found_posts[1], url: found_posts[2], votes: found_posts[3])
    end
  end

  def self.all
    if DB.execute("SELECT * FROM posts").flatten.empty?
      []
    else
      results_array = []
      results = DB.execute("SELECT * FROM posts")
      results.each do |array|
        results_array << new(id: array[0], title: array[1], url: array[2], votes: array[3])
      end
      results_array
    end
  end
end

# post = Post.new(id: 1, title: "happy", url: "www.gay.com", votes: 5)
# p post
# p Post.find(1)
