class Menu < ApplicationRecord
  belongs_to :food
  validates :date_at, presence: true, date: { after_or_equal_to: Time.current.to_date }
  validates :food_id, presence: true
  scope :find_date, ->(date){where("date_at = ?",date)}
end
