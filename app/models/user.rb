class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  mount_uploaders :image, ImageUploader
  serialize :image, JSON

  def full_name
    "#{first_name} #{last_name}"
  end

  def post_count
    0
  end

  def total_followers
    0
  end

  def total_following
    0
  end
end
