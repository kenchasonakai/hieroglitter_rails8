class FavolitesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.favolites.create!
    redirect_to posts_path
  end
end
