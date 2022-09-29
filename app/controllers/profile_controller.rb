class ProfileController < ApplicationController
  def new
  end

  def search_profile
    @username = User.where('user_name Like ?', "%#{params[:q]}%")
  end

  def follow_request
    request = FollowRequest.create!(sender_id: current_user.id, receiver_id: params[:id])
    if request.save
      redirect_to '/profile/new'
    else
      redirect_to '/profile/search_profile'
    end
  end

  # def store_frnd_req
  #   request = FollowRequest.new
  #   request.sender_id=current_user.id
  #   request.receiver_id=params[:user_id]
  #   if request.save
  #     redirect_to '/profile/new'
  #     else
  #       puts "false"
  #   end


  # end


end
