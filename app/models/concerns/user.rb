class User < ApplicationRecord
  has_many :post, foreign_key: 'author_id'
  has_many :comment
  has_many :like

  def three_recent_posts
    Post.where(author: self).order(created_at: :desc).first(3)
  end
end
