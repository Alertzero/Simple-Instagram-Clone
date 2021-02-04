class PostsController < ApplicationController

  before_action :authenticate_user!

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

  def show; end

  def destroy; end

  private

  def post_params
    params.require(:post).permit({image: []}, :image_cache, :description)
  end
end
