class Follower < ApplicationRecord

#belongs_to :user

validates_uniqueness_of :followers_id, scope: :following_id

end

  
  