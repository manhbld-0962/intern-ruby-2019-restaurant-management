class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up, only: [:show, :edit, :update, :destroy]

  def new
    @menu = Menu.new
  end

  def edit
  end

  def show
  end

  def index
    # checkout date to search
    if params[:date_at].nil? || params[:date_at].empty?
      params[:date_at] = Time.now.to_date
    end
    @menus = Menu.find_date(params[:date_at])
  end

  def create
    @food = Food.find(params[:menu][:food_id])
    @menu = @food.menus.build(params_menu)
    if @menu.save
      flash[:success] = "Add Menu Complete!"
      redirect_to menus_path
    else
      render :new
    end
  end

  def update
    if @menu.update_attributes(params_menu_edit)
      flash[:success] = "Update Menu Complete!"
      redirect_to menus_path
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    respond_to :js
  end

  private
  def params_menu
    params.require(:menu).permit(:date_at)
  end

  def params_menu_edit
    params.require(:menu).permit(:date_at, :food_id)
  end

  def set_up
    @menu = Menu.find_by(id: params[:id])
    return if @menu
    flash[:warning] = "Don't exsits!"
    redirect_to menus_path
  end
end
