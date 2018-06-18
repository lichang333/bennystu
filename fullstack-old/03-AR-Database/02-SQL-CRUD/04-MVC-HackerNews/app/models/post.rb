class Post
  # TODO: Gather all code from all previous exercises
  # - reader and accessors
  attr_reader :id
  attr_accessor :title, :url, :votes

  # - initialize
  def initialize(attributes = {})
    @attributes = attributes
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  # - save
  def save
    # DB.execute("id AUTOINCREMENT")
    p @id
    if DB.execute("SELECT * FROM posts WHERE id = ?", @id).empty?
      DB.execute("INSERT INTO posts (id, url, votes, title)
      VALUES (?, ?, ?, ?)", [@id, @url, @votes, @title])
      @id = DB.last_insert_row_id.nil? ? @id = 1 : @id = DB.last_insert_row_id
    else
      @attributes.delete(:id)
      arrays = @attributes.to_a
      arrays.each_with_index do |array, i|
        if array.length < 2
          arrays.delete_at(i)
        else
          array[0] = array[0].to_s
          array[1] = "\'#{array[1]}\'"
          array << @id
        end
      end
      arrays.each do |array|
        string = "UPDATE posts SET #{array[0]} = #{array[1]} WHERE id = #{array[2]}"
        DB.execute(string)
      end
    end
  end

  # - self.find
  def self.find(id)
    found_posts = DB.execute("SELECT * FROM posts WHERE id = ?", id).flatten
    if found_posts.empty?
      nil
    else
      new(id: found_posts[0], title: found_posts[1], url: found_posts[2], votes: found_posts[3])
    end
  end

  # - self.all
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

  # - destroy
  def destroy
    # TODO: destroy the current instance from the database
    DB.execute("DELETE FROM posts WHERE id = ?", @id)
  end
end
