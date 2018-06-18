require 'active_record'
require 'sqlite3'
require 'yaml'

class Artist < ActiveRecord::Base
  has_many :albums
end
