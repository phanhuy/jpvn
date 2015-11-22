class CreateIntroductions < ActiveRecord::Migration
  def change
    create_table :introductions do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
