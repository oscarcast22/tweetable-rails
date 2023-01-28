# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "Destroying all data"

User.destroy_all
Tweet.destroy_all

puts "seeding data"

puts "start creating admin user"

new_admin = User.create(username: "admin", 
                        name: "admin",
                        email: "admin@mail.com",
                        password: "supersecret",
                        password_confirmation: "supersecret",
                        role: "admin")
  if new_admin.save
    puts "Created admin user Succesfully"
    new_admin.avatar.attach(io: File.open("public/images/avatar.jpg"), filename: "avatar.jpg")
  else
    puts "Errors: #{new_admin.errors.full_messages}"
  end

puts "start creating random members users"

4.times do
  new_user = User.create(username: Faker::Internet.unique.username, 
                         name: Faker::FunnyName.unique.name,
                         email: Faker::Internet.unique.email,
                         password: "123456",
                         password_confirmation: "123456",
                         role: "member")
  if new_user.save
    puts "Created random users Succesfully"
    new_user.avatar.attach(io: File.open("public/images/avatar.jpg"), filename: "avatar.jpg")
  else
    puts "Errors: #{new_user.errors.full_messages}"
  end

  puts "creating tweets"

  3..6.times do
    new_tweet = Tweet.create(
      body:Faker::Quote.famous_last_words,
      user_id: new_user.id
    )
    if new_tweet.save
      puts "Created Tweets Succesfully"
    else
      puts "Errors: #{new_tweet.errors.full_messages}"
    end
  end
end
