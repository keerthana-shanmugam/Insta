class ProfileController < ApplicationController
  def new
  end

  def search_profile
    @username = User.where('user_name Like ?', "%#{params[:q]}%")
  end

  def follow
    request = FollowRequest.create!(sender_id: current_user.id, receiver_id: params[:id])
    if request.save
      redirect_to '/profile/new'
    else
      redirect_to '/profile/search_profile'
    end
  end

  def unfollow
    @delete_request = FollowRequest.where(sender_id: current_user.id, receiver_id: params[:id])
    @delete_request.destroy_all
    redirect_to '/profile/search_profile'
  end

end
