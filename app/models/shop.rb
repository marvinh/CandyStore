class Shop < ApplicationRecord
	validates :name, presence: true
	has_many :candies, dependent: :destroy
	has_many :shelves, dependent: :destroy
end
