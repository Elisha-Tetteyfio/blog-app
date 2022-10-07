class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private
  before_validation :update_comment_count

  def update_comment_count
    post.comments_counter += 1
    post.save
  end
end
