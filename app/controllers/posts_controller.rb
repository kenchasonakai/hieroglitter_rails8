class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      @posts = Post.all
      render :index
    end
  end

  private

  def post_params
    { body: hierogliph_body, image: attach_ogp_image }
  end

  def attach_ogp_image
    build_ogp_image(hierogliph_body)
  end

  def hierogliph_body
    params[:post][:body].to_hieroglyph
  end

  def build_ogp_image(text)
    image = MiniMagick::Image.open(Rails.root.join('app', 'assets', 'images', 'ogp.png'))
    image.combine_options do |config|
      config.font Rails.root.join('app', 'assets', 'fonts', 'SegoeUiHistoric.ttf')
      config.fill 'white'
      config.gravity 'center'
      config.pointsize 65
      config.draw "text 0, 0 '#{text.scan(/.{1,13}/).join("\n")}'"
    end
  end
end
