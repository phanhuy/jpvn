class Test < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :user_answers, dependent: :destroy
  has_many :words, through: :results
end
