class Goal < ActiveRecord::Base
  validates :average_score, presence: true
  validate :deadline_valid?

  belongs_to :user
  belongs_to :friend

  def deadline_valid?
    if deadline <= Time.zone.now
      errors.add(:deadline, "Deadline invalid!")
    end
  end
end
