class CatalogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up, only: [:show, :edit, :update, :destroy]

  def new
    @catalog = Catalog.new
  end

  def show
    @posts = Post.find_post(params[:id])
  end

  def index
    @catalogs = Catalog.all
  end

  def create
    @catalog = Catalog.new(params_catalog)
    if @catalog.save
      flash[:success] = "Add catalog complete!"
      redirect_to catalogs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @catalog.update_attributes(params_catalog)
      flash[:success] = "Update catalog complete!"
      redirect_to catalogs_path
    else
      render :edit
    end
  end

  def destroy
    @catalog.destroy
    respond_to :js
  end

  private
  def params_catalog
    params.require(:catalog).permit(:name, :desc)
  end

  def set_up
    @catalog = Catalog.find(params[:id])
    return if @catalog
    flash[:notice] = "Catalog don't exists!"
    redirect_to catalogs_path
  end
end
