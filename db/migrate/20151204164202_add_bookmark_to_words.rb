class AddBookmarkToWords < ActiveRecord::Migration
  def change
    add_column :words, :bookmark, :boolean
  end
end
