class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private
  before_validation :update_like_count

  def update_like_count
    post.likes_counter += 1
    post.save
  end
end
