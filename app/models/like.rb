class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_uniqueness_of :post_id, scope: :user_id
  after_create :update_like
  after_destroy :unlike

  def update_like
    Post.find(post_id).increment(:total_likes_count).save
  end

  def unlike
    Post.find(post_id).decrement(:total_likes_count).save
  end
end
