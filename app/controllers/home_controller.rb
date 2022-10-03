class HomeController < ApplicationController
  def index
  end

  def like
    user_like = Like.new(user_id: current_user.id, post_id: params[:id])
    user_like.save
    redirect_back fallback_location: root_path
  end

  def unlike
    @delete_like = Like.where(user_id: current_user.id, post_id: params[:id])
    @delete_like.destroy_all
    redirect_back fallback_location: root_path
  end
end
