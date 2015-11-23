class AddLogContentToStudyLog < ActiveRecord::Migration
  def change
    add_column :study_logs, :content, :string
  end
end
