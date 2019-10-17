class Discount < ApplicationRecord
	validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
	validates :number, numericality: { only_integer: true, greater_than: 5, less_than_or_equal_to: 50 }, presence: true
	validates :desc, presence: true, length: { maximum: 500 }
end
