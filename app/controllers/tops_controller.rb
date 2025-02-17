class TopsController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]

  def index
    post = Post.find_by(id: params[:post])
    set_meta_tags(og: { image: post.image&.url }) if post
  end
end
