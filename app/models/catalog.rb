class Catalog < ApplicationRecord
	has_many :posts, dependent: :destroy

	validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
	validates :desc, length: { maximum: 500 }
end
