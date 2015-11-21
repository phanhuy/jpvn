class Answer < ActiveRecord::Base
  belongs_to :word

  has_many :user_answers

  scope :suffer, ->{order "RANDOM()"}
  scope :correct, ->{where(is_correct: true).first}
end
