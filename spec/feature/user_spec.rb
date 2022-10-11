require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'index page' do
    before :each do
      visit users_path
      @users = User.all
    end
    it 'It shows the names of all users' do
      @users.each { |user| expect(page).to have_content(user.name) }
    end
    it 'It shows the pictures of all users' do
      @users.each { |_user| expect(page).to have_css('img') }
    end
    it 'It shows the number of posts of each user' do
      @users.each { |user| expect(page).to have_content(user.posts_counter) }
    end
    it 'It redirects to the users page when I click on the user' do
      click_link @users[0].name
      expect(page).to have_current_path(user_path(@users[0]))
    end
  end

  describe 'show page' do
    before :each do
      first_user = User.create(name: 'Test user', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.', posts_counter: 0)
      Post.create(id: rand(1000), user: first_user, title: 'Testing', text: 'This is my first post',
                  comments_counter: 0, likes_counter: 0)
      @user = User.all[4]
      visit user_path(@user.id)
    end
    it 'It shows users picture' do
      expect(page).to have_css('img')
    end
    it 'It shows the users name' do
      expect(page).to have_content(@user.name)
    end
    it 'It shows the number of posts the user has written' do
      expect(page).to have_content(@user.posts_counter)
    end
    it 'It shows the users bio' do
      expect(page).to have_content(@user.bio)
    end
    it 'It shows the users first three posts' do
      recent_posts = @user.recent_posts
      recent_posts.each { |post| expect(page).to have_content(post.text) }
    end
    it 'It has a button to view all posts' do
      expect(page).to have_css('button')
    end
    it 'It redirects to the posts page when I click a post' do
      recent_posts = @user.recent_posts
      click_link recent_posts[0].title
      expect(page).to have_current_path(user_post_path(@user, recent_posts[0]))
    end
    it 'It redirects to the posts/show page when I click the button' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
