class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comment_count
    if post.comments_counter.nil?
      post.comments_counter = 1
    else
      post.comments_counter += 1
    end
  end
end
