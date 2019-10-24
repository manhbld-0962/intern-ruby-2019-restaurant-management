class StaticPagesController < ApplicationController
  def home
    @posts = Post.post_represent.limit(Settings.static_pages.limit_post)
    @foods = Food.available.limit(Settings.static_pages.limit_food)
  end

  def help; end
end
