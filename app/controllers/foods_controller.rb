class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, except: :index
  before_action :load_food, except: %i(index new create)

  def index
    @pagy, @foods = pagy(Food.get_food, items: Settings.pages.page_number)
    @menus = Menu.find_date Time.current.to_date
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new food_params

    if @food.save
      flash[:success] = t("messages.create_success", name: @food.titleize_name)
      redirect_to foods_path
    else
      flash.now[:warning] = t "messages.create_failed"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @food.update_attributes food_params
      flash[:success] = t("messages.update_success", name: @food.titleize_name)
      redirect_to foods_path
    else
      flash.now[:warning] = t "messages.update_failed"
      render :edit
    end
  end

  def destroy
    @food.destroy
    if @food.destroyed?
      respond_to :js
    else
      flash[:warning] = t("messages.delete_failed", name: @food.titleize_name)
      redirect_to foods_path
    end
  end

  private
  def food_params
    params.require(:food).permit Food::FOOD_PARAMS
  end

  def load_food
    @food = Food.find_by id: params[:id]

    return if @food

    flash[:warning] = t("messages.not_exists", name: Food.name)
    redirect_to foods_path
  end
end
