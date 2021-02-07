class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:show]
  def new
    @post = Post.new
  end

  def create
    
    @post = Post.new(post_params)
    @post.user_id = current_user.id if user_signed_in?
    if @post.save
      redirect_to dashboard_path, flash: { success: 'Post was created successfully!' }
    else
      redirect_to new_post_path, flash: { danger: 'Post was not created successfully!' }
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.includes(:user).where(post_id: @post.id)
    
  end

  def destroy; end

  private

  def set_post
    @post = Post.find(params[:id]) if params[:id].present?
  end

  def post_params
    params.require(:post).permit({image: []}, :image_cache, :description)
  end
end
