class Category < ActiveRecord::Base
  has_many :tests, dependent: :destroy
  has_many :words
end
