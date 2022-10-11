require './spec/rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  User.create(name: 'Lily', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { User.create(name: 'Anna', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'posts_counter should be numeric' do
    subject.posts_counter = 'One'
    expect(subject).to_not be_valid
  end
  it 'recent posts should initially be 0' do
    expect(subject.recent_posts.length).to eql(0)
  end
end
