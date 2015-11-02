# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create!(name: "Examples User",
             email: "example@railstutorial.org",
             password: "foobar1234",
             password_confirmation: "foobar1234",
             gender: "male",
             dateofbirth: "1982-10-05"
             )
99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "foobar1234"
    gender = "male"
    dateofbirth = "1989-10-11"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 gender: gender,
                 dateofbirth: dateofbirth
                 )
end

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
following.each { |follower| follower.follow(user) }

