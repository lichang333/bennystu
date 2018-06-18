require 'sqlite3'

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  results = db.execute("SELECT COUNT(*) FROM artists").pop.pop
  return results
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  results = db.execute("SELECT COUNT(*) FROM #{table_name}").pop.pop
  return results
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  results = db.execute("SELECT name FROM artists ORDER BY name ASC").flatten
  return results
end

def love_tracks(db)
  # TODO: return array of love songs' names sorted alphabetically
  results = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%'").flatten
  return results
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  min_length *= 60_000
  results = db.execute("SELECT name FROM tracks WHERE milliseconds > #{min_length} ORDER BY milliseconds ASC").flatten
  return results
end

require "sqlite3"
db = SQLite3::Database.new("lib/db/jukebox.sqlite")

# p artist_count(db)
# p number_of_rows(db, "artists")
# p sorted_artists(db)
# p love_tracks(db)
# p long_tracks(db, 360000)
