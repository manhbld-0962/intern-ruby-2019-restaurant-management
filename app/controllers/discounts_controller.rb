class DiscountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up, only: [:show, :edit, :update, :destroy]

  def new
    @discount = Discount.new
  end

  def show
  end

  def index
    @discounts = Discount.all
  end

  def create
    @discount = Discount.new(params_discount)
    if @discount.save
      flash[:success] = "Create discount complete"
      redirect_to discounts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @discount.update_attributes(params_discount)
      flash[:success] = "Update discount complete"
      redirect_to discounts_path
    else
      render :edit
    end
  end

  def destroy
    @discount.destroy
    respond_to :js
  end

  private
  def params_discount
    params.require(:discount).permit(:name, :number, :desc)
  end

  def set_up
    @discount = Discount.find(params[:id])
    return if @discount
    flash[:notice] = "Discount don't exists!"
    redirect_to discounts_path
  end
end
