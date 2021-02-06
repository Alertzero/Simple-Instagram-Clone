class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploaders :image, ImageUploader
  serialize :image, JSON

  def full_name
    "#{first_name} #{last_name}"
  end

  def post_count
    0
  end

  def total_followers
    Follower.where(followers_id: self.id).count
  end

  def total_following
    Follower.where(following_id: self.id).count
  end
end
