require './spec/rails_helper'

RSpec.describe Post, type: :model do
  #tests go here
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
  subject { Post.create(id: 2, user: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)}
  
  it 'title must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'title must not exceed 250 characters' do
    subject.title = "A"*255
    expect(subject).to_not be_valid
  end
  it 'should increase user posts_counter' do
    first_user.posts_counter = 3
    expect(subject.update_post_count).to eql(4)
  end
  it 'comments_counter should be numeric' do
    subject.comments_counter = "One"
    expect(subject).to_not be_valid
  end
  it 'likes_counter should be numeric' do
    subject.likes_counter = "One"
    expect(subject).to_not be_valid
  end
  it 'recent comments should initially be 0' do
    expect(subject.recent_comments.length).to eql(0)
  end
end

