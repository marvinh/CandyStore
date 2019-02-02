class Shelf < ApplicationRecord
	belongs_to :shop
	has_many :stocks
	has_many :candies , through: :stocks, dependent: :destroy
	validate :validate_shop_exists
	private
		def validate_shop_exists
			errors.add(:shop_id, "is invalid") unless Shop.exists?(self.shop_id)
		end
end
