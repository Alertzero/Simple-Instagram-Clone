class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
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
    Follower.where(followers_id: id).count
  end

  def total_following
    Follower.where(following_id: id).count
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"] && user.email.blank?
        user.email = data["email"]
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name 
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.description = "I am from facebook"
    end
  end
end
