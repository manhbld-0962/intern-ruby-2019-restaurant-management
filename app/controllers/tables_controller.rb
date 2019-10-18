class TablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up, only: [:show, :edit, :update, :destroy]

  def new
    @table = Table.new
  end

  def index
    @tables = Table.all
  end

  def show
  end

  def edit
  end

  def create
    @table = Table.new(params_table)
    if @table.save
      flash[:success] = "Create table complete!"
      redirect_to tables_path
    else
      render :new
    end
  end

  def update
    if @table.update_attributes(params_table)
      flash[:success] = "Update table complete"
      redirect_to tables_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def params_table
    params.require(:table).permit(:type_table, :desc)
  end

  def set_up
    @table = Table.find(params[:id])
    return if @table
    flash[:notice] = "Table don't exists!"
    redirect_to tables_path
  end
end
