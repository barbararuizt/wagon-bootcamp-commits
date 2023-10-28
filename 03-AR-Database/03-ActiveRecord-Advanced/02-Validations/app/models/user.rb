class User < ActiveRecord::Base
  has_many :posts


  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  # TODO: Add some validation
  # TODO: Add some callbacks
end
