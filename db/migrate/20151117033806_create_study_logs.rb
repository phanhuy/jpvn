class CreateStudyLogs < ActiveRecord::Migration
  def change
    create_table :study_logs do |t|
      t.integer :user_id
      t.integer :learned_word

      t.timestamps null: false
    end
  end
end
