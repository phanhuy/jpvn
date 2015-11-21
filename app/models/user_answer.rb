class UserAnswer < ActiveRecord::Base
  belongs_to :test
  belongs_to :word
  belongs_to :answer
end
