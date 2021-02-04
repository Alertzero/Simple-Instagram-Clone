class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }
  mount_uploaders :image, ImageUploader
  serialize :image, JSON
  belongs_to :user
  has_many :likes
  before_create :set_active

  scope :active, -> { where active: true }

  def total_likes
    0
  end

  private

  def set_active
    self.active = true
  end
end
