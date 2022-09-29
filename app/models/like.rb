class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_like_count
    if post.likes_counter.nil?
      post.likes_counter = 1
    else
      post.likes_counter += 1
    end
  end
end
