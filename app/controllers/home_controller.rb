class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def create_like
    user_like = Like.new(user_id: current_user.id, post_id: params[:id])
    user_like.save
    redirect_back fallback_location: "/home/index"
  end

  def delete_like
    @delete_like = Like.where(user_id: current_user.id, post_id: params[:id])
    @delete_like.destroy_all
    redirect_back fallback_location: "/home/index"
  end

  def like
    @posts = Post.find(params[:id])
  end

  def create_comment
    user_comment = Comment.create!(user_id: current_user.id, post_id: params[:post_id], description: params[:description])
    if user_comment.save
      redirect_to '/home/index'
    else
      render plain:false
    end
  end

  def delete_comment
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: "/home/comment"
  end

  def comment
    @posts = Post.find(params[:id])
  end
end
