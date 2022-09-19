class ProfileController < ApplicationController
  def new
  end

  def search
    if params[:q].blank?
      flash[:error] = 'user_name not available'
      return
    else
      @username = User.where('user_name Like ?', "%#{params[:q]}%")
    end
  end
end
