class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :name
      t.float :average_score
      t.float :current_average_score
      t.integer :test_done
      t.integer :current_test_done
      t.integer :test_cancelled
      t.datetime :started_at
      t.datetime :deadline

      t.timestamps null: false
    end
  end
end
