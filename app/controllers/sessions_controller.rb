class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def create
    user_ids = User.pluck(:id)
    redirect_to root_path, error: "𓃭𓍯𓎼𓇋𓈖 𓆑𓄿𓇋𓃭𓇋𓂧" if user_ids.blank?

    user = User.find(user_ids.sample)
    start_new_session_for user
    redirect_to posts_path, success: "𓃭𓍯𓎼𓇋𓈖 𓆑𓄿𓇋𓃭𓇋𓂧"
  end

  def destroy
    terminate_session
    redirect_to root_path
  end
end
