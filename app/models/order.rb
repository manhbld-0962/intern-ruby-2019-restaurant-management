class Order < ApplicationRecord
  ORDER_PARAMS = %i(number).freeze

  belongs_to :food
  belongs_to :booking

  delegate :name, to: :food, prefix: :food

  validates_uniqueness_of :booking_id, scope: :food_id
  validates :food_id, presence: true, on: :create
  validates :number, presence: true, numericality: {only_integer: true}

  def food_name_titleize
    self.food_name.titleize
  end
end
