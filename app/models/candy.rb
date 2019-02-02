class Candy < ApplicationRecord
	belongs_to :shop
	has_many :stocks
	has_many :shelves , through: :stocks, dependent: :destroy
	validate :validate_shop_exists
	validates_uniqueness_of :name , scope: :shop_id
	validates :name, presence: true
	private


		def validate_shop_exists
			errors.add(:shop_id, "is invalid") unless Shop.exists?(self.shop_id)
		end
end
