class Order < ApplicationRecord
  ORDER_PARAMS = %i(number).freeze

  belongs_to :food
  belongs_to :booking

  delegate :name, to: :food, prefix: :food
  delegate :titleize, to: :food_name, prefix: true

  validates_uniqueness_of :booking_id, scope: :food_id
  validates :food_id, presence: true, on: :create
  validates :number, presence: true, numericality: {only_integer: true}
end
