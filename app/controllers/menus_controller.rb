class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :load_menu, except: %i(new create index)
  before_action :load_food, only: :create

  def index
    params[:date_at] = Time.now.to_date if params[:date_at].blank?
    @menus = Menu.find_date params[:date_at]
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = @food.menus.build menu_params_create

    if @food.save
      flash[:success] = t("messages.create_success", name: @menu.get_date)
      redirect_to menus_path
    else
      flash.now[:warning] = t "messages.create_failed"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @menu.update_attributes menu_params_edit
      flash[:success] = t("messages.update_success", name: @menu.get_date)
      redirect_to menus_path
    else
      flash.now[:warning] = t "messages.update_failed"
      render :edit
    end
  end

  def destroy
    @menu.destroy
    if @menu.destroyed?
      respond_to :js
    else
      flash[:warning] = t("messages.delete_failed", name: @menu.get_date)
      redirect_to foods_path
    end
  end

  private
  def menu_params_create
    params.require(:menu).permit Menu::MENU_PARAMS_CREATE
  end

  def menu_params_edit
    params.require(:menu).permit Menu::MENU_PARAMS_EDIT
  end

  def load_menu
    @menu = Menu.find_by id: params[:id]

    return if @menu

    flash[:warning] = t("messages.not_exists", name: Menu.name)
    redirect_to menus_path
  end

  def load_food
    @food = Food.find_by id: params[:menu][:food_id]

    return if @food

    flash[:notice] = t("messages.not_exists", name: Food.name)
    redirect_to menus_path
  end
end
