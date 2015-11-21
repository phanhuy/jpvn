class Word < ActiveRecord::Base
  belongs_to :category
  has_many :user_answers
  has_many :answers
  has_many :tests, through: :user_answers
end
