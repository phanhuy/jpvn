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
50.times do |n|
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

user_feeds = User.order(:created_at).take(6)
50.times do
  learned_word = Faker::Number.digit
  user_feeds.each { |user_feed| user_feed.study_logs.create!(learned_word: learned_word) }
end
Word.create!(vn_word: "gặp",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "会います",
                word_id: 1,
                is_correct: true
                )
Word.create!(vn_word: "chơi",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "遊びます",
                word_id: 2,
                is_correct: true
                )
Word.create!(vn_word: "có (dùng cho đồ vật)",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "あります",
                word_id: 3,
                is_correct: true
                )
Word.create!(vn_word: "đi",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "行きます",
                word_id: 4,
                is_correct: true
                )
Word.create!(vn_word: "gửi",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "送ります",
                word_id: 5,
                is_correct: true
                )
Word.create!(vn_word: "bơi",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "泳ぎます",
                word_id: 6,
                is_correct: true
                )
Word.create!(vn_word: "xong, kết thúc",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "終わります",
                word_id: 7,
                is_correct: true
                )
Word.create!(vn_word: "mua",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "買います",
                word_id: 8,
                is_correct: true
                )
Word.create!(vn_word: "trở về",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "帰ります",
                word_id: 9,
                is_correct: true
                )
Word.create!(vn_word: "mất, tốn",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "かかります",
                word_id: 10,
                is_correct: true
                )
Word.create!(vn_word: "viết",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "書きます",
                word_id: 11,
                is_correct: true
                )
Word.create!(vn_word: "cho mượn",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "貸します",
                word_id: 12,
                is_correct: true
                )
Word.create!(vn_word: "nghe",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "聞きます",
                word_id: 13,
                is_correct: true
                )
Word.create!(vn_word: "cắt",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "切ります",
                word_id: 14,
                is_correct: true
                )
Word.create!(vn_word: "biết",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "知ります",
                word_id: 15,
                is_correct: true
                )
Word.create!(vn_word: "hút (thuốc)",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "吸います",
                word_id: 16,
                is_correct: true
                )
Word.create!(vn_word: "chụp (hình)",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "撮ります",
                word_id: 17,
                is_correct: true
                )
Word.create!(vn_word: "học (có người dạy)",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "習います",
                word_id: 18,
                is_correct: true
                )
Word.create!(vn_word: "uống",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "飲みます",
                word_id: 19,
                is_correct: true
                )
Word.create!(vn_word: "vào (đâu đó)",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "入ります",
                word_id: 20,
                is_correct: true
                )
Word.create!(vn_word: "làm việc",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "働きます",
                word_id: 21,
                is_correct: true
                )
Word.create!(vn_word: "nói",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "話します",
                word_id: 22,
                is_correct: true
                )
Word.create!(vn_word: "chờ",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "待ちます",
                word_id: 23,
                is_correct: true
                )
Word.create!(vn_word: "nhận",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "もらいます",
                word_id: 24,
                is_correct: true
                )
Word.create!(vn_word: "nghỉ ngơi",
                pronunciation: "",
                category_id: 2
                )
Answer.create!(jp_word: "休みます",
                word_id: 25,
                is_correct: true
                )
all_words = Word.all
random_failed_answer = ["来ます", "買い物します", "忘れます", "やめます", "迎えます", "負けます", "始めます"]
all_words.each do |item|
  3.times do ||
    Answer.create!(jp_word: random_failed_answer[rand(0..random_failed_answer.length-1)],
                  word_id: item.id,
                  is_correct: false
                  )
  end
end
