require 'date'

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
  has_many :chats1, class_name: "Chatroom", foreign_key: :user1_id
  has_many :chats2, class_name: "Chatroom", foreign_key: :user2_id
  validates :username, presence: true

  def not_messaged
    messaged = chatrooms.map do |chat|
      chat.users[0] == self ? chat.users[1].id : chat.users[0].id
    end
    messaged << id
    User.where.not(id: messaged)
  end

  def chatrooms
    [chats1, chats2].flatten
  end

  def days_meals
    meal_eatens.where(date: Date.today)
  end

  def days_calories
    total = 0
    days_meals.each { |m| total += m.meal.total_calories }
    total
  end

  def days_protiens
    total = 0
    days_meals.each { |m| total += m.meal.total_proteins }
    total
  end

  def days_fats
    total = 0
    days_meals.each { |m| total += m.meal.total_fats }
    total
  end

  def days_carbs
    total = 0
    days_meals.each { |m| total += m.meal.total_carbs }
    total
  end
end
