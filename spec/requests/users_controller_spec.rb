require './spec/rails_helper'

describe UsersController, type: :request do
  before :each do
    @link = get users_path
    get users_path
  end

  it 'Response value is 200' do
    expect(@link).to eql(200)
  end

  it 'Renders a correct template' do
    expect(response).to render_template('users/index')
  end

  it 'Has the correct placeholder text' do
    expect(response.body).to include('Blog App')
  end
end
