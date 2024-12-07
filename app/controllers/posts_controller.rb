class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(body: params[:post][:body].to_hieroglyph)
    if @post.save
      redirect_to posts_path
    else
      @posts = Post.all
      render :index
    end
  end
end
