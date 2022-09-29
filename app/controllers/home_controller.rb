class HomeController < ApplicationController
  def index
  end

  def like
    user_like = Like.new()
  end
end
