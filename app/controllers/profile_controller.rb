class ProfileController < ApplicationController
  def new
  end

  def search_profile
    @username = User.where('user_name Like ?', "%#{params[:q]}%")
  end

  def follow
    request = FollowRequest.create!(sender_id: current_user.id, receiver_id: params[:id])
    request.save
    redirect_back fallback_location: profile_search_profile_path
  end

  def unfollow
    @delete_request = FollowRequest.where(sender_id: current_user.id, receiver_id: params[:id])
    @delete_request.destroy_all
    redirect_back fallback_location: profile_search_profile_path
  end

end
