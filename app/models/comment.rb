class Comment < ApplicationRecord

belongs_to :post
belongs_to :user

validates_presence_of :comment
validates_presence_of :user_id
validates_presence_of :post_id

attr_accessor :return_to

after_create :update_comment_count
after_destroy :delete_comment_count

  def update_comment_count
    Post.find(self.post_id).increment(:total_comments_count).save
  end

  def delete_comment_count
    Post.find(self.post_id).decrement(:total_comments_count).save
  end

end