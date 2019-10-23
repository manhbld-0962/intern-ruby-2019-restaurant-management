class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up, only: [:show, :edit, :update, :destroy]

  def new
  	@food = Food.new
  end

  def show
  end

  def edit
  end

  def index
  	@foods = Food.all
  end

  def create
  	@food = Food.new(params_food)
  	if @food.save
  		flash[:success] = "Add Food Complete!"
  		redirect_to foods_path
  	else
  		render :new
  	end
  end

  def update
    if @food.update_attributes(params_food)
      flash[:success] = "Update Food Complete!"
      redirect_to foods_path
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    respond_to :js
  end

  private
  def params_food
  	params.require(:food).permit(:name, :desc, :status_food, :cost, :price)
  end

  def set_up
  	@food = Food.find_by(id: params[:id])
  	return if @food
  	flash[:warning] = "Food don't exsits!"
  	redirect_to foods_path
  end
end
