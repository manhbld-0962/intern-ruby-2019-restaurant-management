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
  end

  def destroy
  end

  private
  def params_post
    params.require(:post).permit(:title, :content)
  end

  def set_up
    @post = Post.find(params[:id])
    return if @post
    flash[:notice] = "Post don't exsits!"
    redirect_to catalog_posts_path
  end
end
