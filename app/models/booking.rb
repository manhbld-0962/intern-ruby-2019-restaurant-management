class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :table
  enum people: [:single, :couple, :family, :meeting]
  enum checkout: [:unpaid, :paid]

  validates :people, presence: true, on: :create
  validates :checkout, presence: true, on: :update
  validates :user_id, presence: true, on: :create
  validates :table_id, presence: true
  validates :book_at, presence: true, date: { after_or_equal_to: Time.current+7.hours }
  validates_uniqueness_of :book_at, scope: [:user_id, :table_id]  
  scope :find_book, -> (id) {where("user_id = ?", id)}
  scope :check_book_exsits, -> (time) {where("book_at >= SUBTIME(?,'2:0') and book_at <= ADDTIME(?,'2:0')",time, time)}
end
