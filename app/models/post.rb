class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependant: :destroy
  has_one_attached :photo
  validates :photo, attached: true
end
