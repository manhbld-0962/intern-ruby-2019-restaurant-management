class DiscountsController < ApplicationController
  before_action :authenticate_member!
  skip_before_action :set_up, [:new, :index]

  def new
    @discount = Discount.new
  end

  def show
    @discounts = Discount.all
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def params_discount
    params.require(:discount).permit(:name, :number, :desc)
  end

  def set_up
    @discount = Discount.find(params[:id])
    return if @disount
    flash[:notice] = "Discount don't exists!"
    redirect_to discounts_path
  end
end
