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

# Fake Category
Category.create!(name: "Danh từ",
                description: "Danh từ trong tiếng Việt"
                )
Category.create!(name: "Động từ",
                description: "Động từ trong tiếng Việt"
                )
Category.create!(name: "Tính từ",
                description: "Tính từ trong tiếng Việt"
                )
Category.create!(name: "Đồ dùng gia đình",
                description: "Đồ dùng gia đình"
                )
Category.create!(name: "Trường học",
                description: "Trường học"
                )
Category.create!(name: "Nghề nghiệp",
                description: "Nghề nghiệp"
                )
Category.create!(name: "Phương tiện giao thông",
                description: "Phương tiện giao thông"
                )
Category.create!(name: "Các môn thể thao",
                description: "Các môn thể thao"
                )
