class TopsController < ApplicationController
  def index
    post = Post.find_by(id: params[:post])
    set_meta_tags(og: { image: post.image&.url }) if post
  end
end
