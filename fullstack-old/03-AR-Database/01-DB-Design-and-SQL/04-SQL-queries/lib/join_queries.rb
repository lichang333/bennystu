require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  db.execute("SELECT tracks.name, albums.title, artists.name FROM tracks
  JOIN albums ON albums.id = album_id
  JOIN artists ON artists.id = artist_id")
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  array = db.execute("SELECT COUNT(*), AVG(milliseconds)/60000 FROM tracks
  JOIN genres ON genres.id = genre_id
  WHERE genres.name = '#{genre_name}'").flatten
  { category: genre_name, number_of_songs: array[0], avg_length: array[1].round(2) }
end

# def top_five_artists(db, genre_name)
#   # TODO: return list of top 5 artists with the most songs for a given genre.
#   array = db.execute("SELECT name FROM artists
#   JOIN tracks ON artists.id = tracks.artist_id
#   JOIN genres ON genres.id = tracks.genre_id
#   WHERE genres.name = '#{genre_name}'").flatten
# end




def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  array = db.execute("SELECT artists.name, COUNT(*)  FROM tracks
  JOIN albums ON albums.id = album_id
  JOIN artists ON artists.id = albums.artist_id
  JOIN genres ON genres.id = genre_id
  WHERE genres.name = '#{genre_name}'
  GROUP BY artists.name
  ORDER BY COUNT(*) DESC")[0...5]
end

require "sqlite3"
db = SQLite3::Database.new("lib/db/jukebox.sqlite")
p top_five_artists(db, 'Rock')
