module FoodsHelper
  def list_status_food
    Food.status_foods.keys
  end

  def list_food
    Food.get_food
  end
end
