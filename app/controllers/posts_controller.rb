class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def show
  end

  def index
    @posts = Post.all
  end

  def create
    @catalog = Catalog.find(params[:catalog_id])
    @post = @catalog.posts.new(params_post)
    if @post.save
      flash[:success] = "Add Post Complete!"
      redirect_to catalog_path(params[:catalog_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(params_post_edit)
      flash[:success] = "Update Post Complete!"
      redirect_to catalog_path(@post.catalog.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    respond_to :js
  end

  private
  def params_post
    params.require(:post).permit(:title, :content)
  end

  def params_post_edit
    params.require(:post).permit(:catalog_id, :title, :content)
  end

  def set_up
    @post = Post.find_by(id: params[:id])
    return if @post
    flash[:warning] = "Post don't exsits!"
    redirect_to catalog_posts_path
  end
end
