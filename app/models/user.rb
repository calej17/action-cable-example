class User < ApplicationRecord
  has_many :chatrooms, through: :messages
  has_many :messages
  validates :username, presence: true, uniqueness: true

  def self.authenticate(username = "")
    user = User.find_by_username(username)
    user ? user : false
  end
end
