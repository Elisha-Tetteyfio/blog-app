class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: {maximum: 250}
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_count
    if user.posts_counter.nil?
      user.posts_counter = 1
    else
      user.posts_counter += 1
    end
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
