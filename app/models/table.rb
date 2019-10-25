class Table < ApplicationRecord
	has_many :books
	has_many :users, through: :books 
  enum type_table: [:single ,:couple, :family, :meeting]
  enum status_table: [:free, :busy, :booked]
  validates :type_table, presence: true
  validates :status_table, presence: true
  validates :desc, presence: true, length: { maximum: 100 }
end
