class PostsController < ApplicationController
  def new
  end

  def create
    # debugger
    posts = Post.create!(
      image: params[:image],
      description: params[:description],
      user_id: current_user.id
    )
    if posts.save
      redirect_to '/home/index'
    else
      render plain:false
    end
  end

  def user_post
    @item_post = Post.all
  end
end
