require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
Food.destroy_all
Meal.destroy_all
MealEatens.destroy_all
Chatroom.destroy_all
Like.destroy_all
WorkoutExercise.destroy_all
WorkoutSession.destroy_all
Workout.destroy_all
User.destroy_all

j = 0

user = User.create!({ avatar_url: "https://i.pravatar.cc/150?img=#{j}", username: 'jesse', email: 'jesse@dynami.com', password: '123456', password_confirmation: '123456' })
j += 1
User.create!({ avatar_url: "https://i.pravatar.cc/150?img=#{j}", username: 'callum', email: 'callum@dynami.com', password: '123456', password_confirmation: '123456' })
j += 1
User.create!({ avatar_url: "https://i.pravatar.cc/150?img=#{j}", username: 'sholom', email: 'sholom@dynami.com', password: '123456', password_confirmation: '123456' })
j += 1
workout = Workout.create!({ workout_type: "Push", name: "Chest Day", user: user})
WorkoutExercise.create!({ name: "Bench Press", workout: workout, reps: 10, sets: 3, weight: 70 })
WorkoutSession.create!({ user: user, workout: workout, time: Time.now })

10.times do
  User.create!({ avatar_url: "https://i.pravatar.cc/150?img=#{j}", username: Faker::FunnyName.name, email: Faker::Internet.email, password: '123456', password_confirmation: '123456' })
  j += 1
end

image1 = 'https://images.unsplash.com/photo-1594381898411-846e7d193883?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
image2 = "https://images.unsplash.com/photo-1606889464198-fcb18894cf50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=490&q=80"
image3 = 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'
image4 = 'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'
image5 = 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'
[image1, image2, image3, image4, image5].each do |url|
  logo = URI.open(url)
  post = Post.new
  user = User.create!({ avatar_url: "https://i.pravatar.cc/150?img=#{j}", username: Faker::FunnyName.name, email: Faker::Internet.email, password: '123456', password_confirmation: '123456' })
  j += 1
  post.user = user
  post.caption = Faker::GreekPhilosophers.quote
  post.photo.attach(io: logo, filename: "post.jpeg", content_type: 'image/jpeg')
  post.save!
end
