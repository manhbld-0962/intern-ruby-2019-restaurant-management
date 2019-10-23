class Food < ApplicationRecord
	enum status: [:yes, :no]
	validates :name, presence: true, uniquess: true, length: { maximum: 100 }
	validates :desc, presence: true
	validates :price, presence: true
	validates :cost, presence: true
end
