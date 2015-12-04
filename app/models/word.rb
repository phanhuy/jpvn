class Word < ActiveRecord::Base
  belongs_to :category
  has_many :user_answers
  has_many :answers
  has_many :tests, through: :user_answers

  # scope :learned, ->(user, category){joins(:tests).where(tests: {user_id: user.id})
  #   .distinct.where.not user_answers: {answer_id: nil}}
  # scope :not_learn, ->(user, category){where.not id: category.words.learned(user, category)}
  # scope :all_word, ->(user, category){}

  accepts_nested_attributes_for :answers,
    reject_if: ->attributes{attributes["content"].blank?},
    allow_destroy: true

  def self.all_word category_id
    where("category_id = ?", category_id)
  end

  def self.bookmark_word category_id
    where("category_id = ? AND bookmark = ? ", category_id, true)
  end

  def self.no_bookmark_word category_id
    where("category_id = ? AND bookmark IS NOT ? ", category_id, true)
  end
end
