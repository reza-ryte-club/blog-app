class PagesController < ApplicationController
  def index
    @posts = Post.all.reverse
    if current_user
      @my_posts = Post.where(users_id: current_user.id).reverse
    else
      @my_posts = []
    end
  end
end
