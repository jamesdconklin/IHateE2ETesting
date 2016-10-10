require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'render new user page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'should redirect to show page for created user' do
        post :create, user: { username: "test", password: "password" }
        expect(response).to redirect_to user_url(User.find_by_username("test"))
      end
    end

    context 'with invalid params' do
      before(:each) do
        post :create, user: {username:"test"}
      end
      it 'should redirect to new user page' do
        expect(response).to redirect_to new_user_url
      end
      # it 'should flash an error' do
      #   expect
      # end
    end
  end

  describe 'GET #show' do
    before(:each) do
      FactoryGirl.create(:user)
    end
    context 'with valid params' do
      it 'should redirect to appropriate show page' do
        get :show, id:1
        expect(response).to render_template :show
      end
    end

    context 'with invalid params' do
      it 'should raise an error' do
        get :show, id:-1
        # expect TODO: flash error
        expect(response).to redirect_to users_url
      end
    end


  end

end
