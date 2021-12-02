# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!({ username: 'jesse', email: 'jesse@dynami.com', password: '123456', password_confirmation: '123456' })
User.create!({ username: 'callum', email: 'callum@dynami.com', password: '123456', password_confirmation: '123456' })
workout = Workout.create!({ workout_type: "Push", name: "Chest Day", user: user})
WorkoutExercise.create!({ name: "Bench Press", workout: workout, reps: 10, sets: 3, weight: 70 })
WorkoutSession.create!({ user: user, workout: workout, time: Time.now })
