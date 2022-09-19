class PostsController < ApplicationController
  def new
  end

  def create
    # debugger
    @posts = Post.new(post_params)
    @posts.user_id = current_user.id
    p "===================================="
    p "===================================="
    p "===================================="
 puts @posts.description
    if @posts.save
      redirect_to '/profile/new'
    else
      render plain:false
    end
  end

  private

  def post_params
    params.require(:posts).permit(:image, :description)
  end
end
