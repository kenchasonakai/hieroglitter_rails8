class Api::TranslatedTextsController < ApplicationController
  def show
    post = Post.find(params[:id])
    render json: { translated_text: post.translated_text }
  end
end
