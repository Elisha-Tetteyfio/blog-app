require 'rails_helper'

RSpec.describe Post, type: :feature do
  describe 'index page' do
    before :each do
      first_user = User.create(name: 'Test user', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.', posts_counter: 0)
      @p1 = Post.create(id: rand(1000), user: first_user, title: 'Testing', text: 'This is my first post',
                        comments_counter: 0, likes_counter: 0)
      Comment.create(user: first_user, post: @p1, text: 'First comment')
      @user = User.all[4]
      visit user_posts_path(@user.id)
    end
    it 'It shows the current users picture' do
      expect(page).to have_css('img')
    end
    it 'It shows the current users name' do
      expect(page).to have_content(@user.name)
    end
    it 'It shows the number of posts the user has written' do
      expect(page).to have_content(@user.posts_counter)
    end
    it 'It shows the posts text' do
      user_posts = @user.posts
      user_posts.each { |post| expect(page).to have_content(post.text) }
    end
    it 'It shows the first comment on a post' do
      user_posts = @user.posts.includes(:comments)
      user_posts.each { |post| expect(page).to have_content(post.comments[0].text) }
    end
    it 'It shows the number of comments a post has' do
      user_posts = @user.posts.includes(:comments)
      user_posts.each { |post| expect(page).to have_content(post.comments_counter) }
    end
    it 'It shows the number of likes a post has' do
      user_posts = @user.posts
      user_posts.each { |post| expect(page).to have_content(post.likes_counter) }
    end
    it 'It redirects to the posts page when I click on a post' do
      post = @user.posts[0]
      click_link post.title
      expect(page).to have_current_path(user_post_path(@user, post))
    end
  end
end
