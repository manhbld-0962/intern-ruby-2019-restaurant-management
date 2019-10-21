class Catalog < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
	validates :desc, legnth: { maximum: 500 }
end
