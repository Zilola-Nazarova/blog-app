class Post < ApplicationRecord
  has_many :comment
  has_many :like
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def five_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  def update_comments_counter
    update(comments_counter: Comment.where(post_id: id).count)
  end

  def update_likes_counter
    update(likes_counter: Like.where(post_id: id).count)
  end
end
