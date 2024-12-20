class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.favorites.create!
    redirect_to posts_path
  end
end
