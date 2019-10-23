class Food < ApplicationRecord
	enum status_food: [:yes, :no]

	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :desc, presence: true
	validates :price, presence: true
	validates :cost, presence: true
end
