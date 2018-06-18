class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  # TODO
  def save
    p DB.execute("SELECT * FROM posts")
    # DB.execute("id AUTOINCREMENT")
    if DB.execute("SELECT * FROM posts WHERE id = ?", @id).empty?
      DB.execute("INSERT INTO posts (id, url, votes, title)
      VALUES (?, ?, ?, ?)", [@id, @url, @votes, @title])
      @id = DB.last_insert_row_id.nil? ? @id = 1 : @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE posts SET title = ?, url = ?, votes = ? WHERE id = ?", [@title, @url, @votes, @id])
    end
  end
end
