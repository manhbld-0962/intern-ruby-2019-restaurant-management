class Order < ApplicationRecord
  belongs_to :food
  belongs_to :booking

  validates_uniqueness_of :booking_id, scope: :food_id
  validates :food_id, presence: true, on: :create
  validates :number, presence: true, numericality: {only_integer: true}
end
