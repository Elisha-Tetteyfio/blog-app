require './spec/rails_helper'

RSpec.describe Like, type: :model do
  # tests go here
  first_user = User.create(name: 'Like user', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Mexico.', posts_counter: 0)
  first_post = Post.create(user: first_user, title: 'Hello', text: 'This is my first post',
                           comments_counter: 0, likes_counter: 0)
  subject { Like.create(user: first_user, post: first_post) }

  # it 'should increase post likes_counter' do
  #   first_post.likes_counter = 3
  #   expect(subject.update_like_count).to eql(4)
  # end
end
