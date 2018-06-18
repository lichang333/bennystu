class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :name, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: false }
  validates :url, uniqueness: true, presence: true, format:
  { with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/i, multiline: true }

  # TODO: Add some validation
end
