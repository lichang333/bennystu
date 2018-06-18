require "faker"

class User < ActiveRecord::Base
  before_validation :strip_email
  after_create :send_email
  has_many :posts
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }, presence: true


  def strip_email
    email.strip! unless email.nil?
  end

  def send_email
    FakeMailer.instance.mail(email, 'Welcome to HN!')
  end
  # TODO: Add some validation
  # TODO: Add some callbacks
end
