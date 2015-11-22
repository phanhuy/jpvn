class RemoveLearnedWordFromStudyLog < ActiveRecord::Migration
  def change
    remove_column :study_logs, :learned_word, :integer
  end
end
