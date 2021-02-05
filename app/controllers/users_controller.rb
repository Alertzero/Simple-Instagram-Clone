class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile]

  def index
    @posts = Post.active
    following_ids = Follower.where(followers_id: current_user.id).map(&:following_id)
    following_ids << current_user.id
    @follower_suggestions = User.where.not(id: following_ids)
  end

  def show; end

  def profile
    @posts = @user.posts.active
  end

  def follow_user
    followers_id = params[:follow_id]
    if Follower.create!(followers_id: current_user.id, following_id: followers_id)
      flash[:success] = 'Followed!'
    else
      flash[:danger] = 'Unable to follow!'
    end

    redirect_to dashboard_path
  end

  private

  def set_user
    @user = User.find_by_username(params[:username])
  end
end
