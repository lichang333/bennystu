require_relative "models/artist"
require 'active_record'
require 'sqlite3'
require 'yaml'

def reversed_sorted_artists
  # TODO: return an ActiveRecord::Relation (array) of Artist, in reversed alphabetical order
  all_artists = Artist.all
  p all_artists
end

def love_tracks
  # TODO: return an ActiveRecord::Relation (array) of Track which sings about Love
end

def long_tracks(min_length)
  # TODO: return an ActiveRecord::Relation (array) of Track of at least `min_length` minutes
end

def top_five_artists(genre_name)
  # TODO: return the 5 artists with the more tracks of genre `genre_name`
end

reversed_sorted_artists
