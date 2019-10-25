class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :table
  enum people: [:single, :couple, :family, :party]
  enum checkout: [:unpaid, :paid]

	validates :people, presence: true
	validates :checkout, presence: true
	validates :user_id, presence: true
	validates :table_id, presence: true
	validates :book_at, presence: true, date: { after_or_equal_to: Time.current.to_date } 
end
