class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meals
  has_many :meal_eatens
  has_many :workouts
  has_many :workout_sessions
  has_many :exercises
  has_many :chatrooms
end
