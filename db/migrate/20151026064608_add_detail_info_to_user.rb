class AddDetailInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :dateofbirth, :datetime    
  end
end
