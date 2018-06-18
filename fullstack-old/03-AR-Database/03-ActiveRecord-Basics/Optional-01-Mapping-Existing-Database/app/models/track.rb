class Track < ActiveRecord::Base
  has_one :genres
  has_one :albums
  belongs_to :media_type
end
