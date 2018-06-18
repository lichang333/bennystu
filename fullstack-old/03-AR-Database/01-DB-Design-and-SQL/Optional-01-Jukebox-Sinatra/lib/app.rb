require "sinatra"
require "sinatra/reloader" if development?
require "sqlite3"

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), 'db/jukebox.sqlite'))

get "/" do
  # TODO: Gather all artists to be displayed on home page
  @title = "Jukebox"
  @my_artists = DB.execute("SELECT name, id FROM artists ORDER BY name ASC")
  erb :home # Will render views/home.erb file (embedded in layout.erb)
end

get "/artists/:id" do
  artist_id = params[:id]
  @albums = DB.execute("SELECT title, id FROM albums WHERE artist_id = #{artist_id}")
  artist = DB.execute("SELECT name FROM artists WHERE id = #{artist_id}").flatten.pop
  @title = artist
  erb :artists
end

get "/albums/:id" do
  album_id = params[:id]
  @tracks = DB.execute("SELECT name, id FROM tracks WHERE album_id = #{album_id}")
  album = DB.execute("SELECT title FROM albums WHERE id = #{album_id}").flatten.pop
  @title = album
  erb :albums
end

get "/tracks/:id" do
  track_id = params[:id]
  @info = DB.execute("SELECT name, composer, milliseconds, bytes, unit_price, id FROM tracks
    WHERE id = #{track_id}").flatten
  track = DB.execute("SELECT name FROM tracks WHERE id = #{track_id}").flatten.pop
  @title = track
  erb :tracks
end


# Then:
# 1. Create an artist page with all the albums. Display genres as well
# 2. Create an album pages with all the tracks
# 3. Create a track page with all the track info
