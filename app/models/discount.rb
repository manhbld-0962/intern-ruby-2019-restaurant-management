class Discount < ApplicationRecord
  DISCOUNT_PARAMS = %i(name discount_value description).freeze

  scope :get_discount, ->{select(:id, :name, :discount_value).order(:discount_value)}

  validates :name, presence: true, uniqueness: true, length: {maximum: Settings.models.discounts.name}
  validates :discount_value, presence: true, numericality: {only_integer: true, greater_than: Settings.models.discounts.minimum, less_than_or_equal_to: Settings.models.discounts.maximum}
  validates :description, presence: true, length: {maximum:  Settings.models.discounts.description}

  def titleize_name
    self.name.titleize
  end
end
