class TranslateHieroglyphsController < ApplicationController
  def create
    TranslateHieroglyphJob.perform_now(params[:post_id])
    redirect_to posts_path
  end
end
