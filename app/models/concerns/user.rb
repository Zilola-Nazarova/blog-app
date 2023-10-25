class User < ApplicationRecord
  has_many :comment
  has_many :like
  
  def three_recent_posts
    Post.where(author: self).order(created_at: :desc).first(3)
  end

  def update_posts_counter
    update(posts_counter: Post.where(author_id: id).count)
  end
end
