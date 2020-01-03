class Food < ApplicationRecord
  FOOD_PARAMS = %i(name description price cost status_food).freeze
  FOOD_LOAD_PARAMS = %i(id name description price cost).freeze

  has_many :menus, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: Settings.models.foods.name}
  validates :description, :price, :cost, presence: true

  enum status_food: [:unavailable, :available]

  scope :get_food, ->{select(FOOD_LOAD_PARAMS).order(:name)}

  enum status_food: [:no, :yes]

  scope :food_ready, ->{where(status_food: :yes)}
  scope :get_food, ->{select(FOOD_LOAD_PARAMS).order(:name)}

  def titleize_name
    self.name.titleize
  end
end
