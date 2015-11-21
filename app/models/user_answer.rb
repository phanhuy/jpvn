class UserAnswer < ActiveRecord::Base
  belongs_to :test
  belongs_to :word
  belongs_to :answer

  scope :answered, ->{where.not answer_id: nil}
  scope :unanswered, ->{where answer_id: nil}
  scope :correct_answer, ->{joins(:answer).where answers: {is_correct: true}}

  def correct?
    self.answer.nil? ? false : self.answer.is_correct
  end
end
