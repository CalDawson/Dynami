class Food < ApplicationRecord
  belongs_to :meal
  validates :name, presence: true
end
