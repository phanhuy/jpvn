class Test < ActiveRecord::Base
  #include ActivityLog
  after_update :create_finish_test_log
  
  belongs_to :user
  belongs_to :category

  has_many :user_answers, dependent: :destroy
  has_many :words, through: :user_answers
  has_many :answers, through: :user_answers
  has_many :activities, as: :targetable

  accepts_nested_attributes_for :user_answers

  before_create lambda {
    words = self.category.words.order("RANDOM()").limit 20
    self.words = words
  }

  def finished?
    !self.mark.nil?
  end

  def create_finish_test_log
    unless finished?
      #create_log self, self.user_id, "Done"
    end
  end
end
