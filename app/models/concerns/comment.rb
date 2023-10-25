class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
