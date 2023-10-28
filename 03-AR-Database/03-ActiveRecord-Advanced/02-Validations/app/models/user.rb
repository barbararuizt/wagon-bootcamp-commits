class User < ActiveRecord::Base
  has_many :posts
  before_validation :clean_username
  after_create :welcome_email

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  # TODO: Add some validation

  private

  def clean_username
    self.email = email.strip unless email.nil?
  end

  def welcome_email
    FakeMailer.instance.mail(email, "Welcome to HN!")
  end
  # TODO: Add some callbacks
end
