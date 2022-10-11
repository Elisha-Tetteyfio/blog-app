require './spec/rails_helper'

describe PostsController, type: :request do
  describe "'/index' page" do
    before :each do
      @link = get '/users/:id/posts'
      get '/users/:id/posts'
    end

    # it 'Response value is 200' do
    #   expect(@link).to eql(200)
    # end

    # it 'Renders a correct template' do
    #   expect(response).to render_template('posts/index')
    # end

    # it 'Has the correct placeholder text' do
    #   expect(response.body).to include('Blog App')
    # end
  end

  describe "'/show' page" do
    before :each do
      @link = get '/users/:id/posts/show'
      get '/users/:id/posts/show'
    end

    # it 'Response value is 200' do
    #   expect(@link).to eql(200)
    # end

    # it 'Renders a correct template' do
    #   expect(response).to render_template('posts/show')
    # end

    # it 'Has the correct placeholder text' do
    #   expect(response.body).to include('Blog app')
    # end
  end
end
