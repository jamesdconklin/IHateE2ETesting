# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content("Sign Up!")
  end

  feature "signing up a user" do
    before(:each) { sign_up("franky frank") }

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content("Welcome, franky frank")
    end

  end

end

feature "logging in" do
  before(:each) do
    FactoryGirl.create(:user, {username: "franky frank"})
    sign_in("franky frank")
  end
  scenario "shows username on the homepage after login" do
    expect(page).to have_content("Welcome, franky frank")
  end

end

feature "logging out" do
  before(:each) do
    FactoryGirl.create(:user, {username: "franky frank"})
  end
  scenario "begins with a logged out state" do
    visit user_url(User.last)
    expect(page).to have_content("Welcome, guest")
  end

  scenario "doesn't show username on the homepage after logout" do
    visit user_url(User.last)
    sign_in("franky frank")
    save_and_open_page
    click_link "Sign Out"
    expect(page).not_to have_content("Welcome, franky frank")
  end

end
