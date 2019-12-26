class Food < ApplicationRecord
  FOOD_PARAMS = %i(name description price cost status_food).freeze
  enum status_food: [:no, :yes]

  scope :food_ready, ->{where(status_food: :yes).limit(8)}
  scope :get_food, ->{select(:id, :name, :description, :price, :cost).order(:name)}

  validates :name, presence: true, uniqueness: true, length: {maximum: Settings.models.foods.name}
  validates_presence_of :description, :price, :cost

  def titleize_name
    self.name.titleize
  end
end
