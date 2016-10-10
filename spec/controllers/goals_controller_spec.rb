require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  before(:each) do
    FactoryGirl.create(:user)
  end

  describe 'GET #new' do
    it 'render new goal page' do
      get :new, user_id:1
      expect(response).to render_template(:new)
    end
  end


  describe 'POST #create' do
    let!(:goal) { FactoryGirl.build(:goal, title: 'test') }
    context 'with valid params' do
      it 'should redirect to show page for created goal' do
        post :create, goal: goal.attributes, user_id:1
        expect(response).to redirect_to goal_url(Goal.find_by(title: 'test'))
      end
    end

    context 'with invalid params' do
      it 'should redirect to new goal page' do
        goal.title = nil
        post :create, goal: goal.attributes, user_id:1
        expect(response).to redirect_to new_user_goal_url(1)
      end
    end
      # it 'should flash an error' do
      #   expect
      # end
  end

  describe 'GET #show' do
    before(:each) do
      FactoryGirl.create(:goal, title: 'test')
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
