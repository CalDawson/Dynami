class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"

  def users
    [user1, user2]
  end
end
