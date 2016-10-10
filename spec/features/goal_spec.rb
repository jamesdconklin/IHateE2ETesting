require 'spec_helper'
require 'rails_helper'

feature "goal creation" do
  before(:each) do
    FactoryGirl.create(:user, username: 'Franky')
    sign_in('Franky')
  end

  scenario 'begins with no goals' do
    expect(page).not_to have_content("fizzbang")
  end

  scenario 'shows link to new goal form' do
    click_link('New Goal')
    expect(page).to have_content("Create New Goal")
  end

  scenario 'using the form' do
    scenario 'shows link to new goal form' do
      click_link('New Goal')
      expect(page).to have_content("Create New Goal")
    end

    scenario 'create goal with valid parameters' do
      click_link('New Goal')
      goal = FactoryGirl.build(:goal, title: "Foo fizzbang bar")
      new_goal(goal.attributes)
      expect(page).to have_content("fizzbang")
      expect(current_path).to equal(goal_url(goal))
    end

    scenario 'create goal with invalid parameters'
  end

end

feature "goal display"


feature "goal editing"
