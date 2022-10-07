class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  before_validation :set_defaults, :update_post_count

  def set_defaults
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end

  def update_post_count
    user.posts_counter += 1
    user.save
  end
end
