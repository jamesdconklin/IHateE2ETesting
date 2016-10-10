require 'rails_helper'

RSpec.describe Goal, type: :model do
  before(:each) do
    FactoryGirl.create(:user)
    FactoryGirl.create(:goal)
  end


  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:user)}
    it {should validate_inclusion_of(:private).in_array([true, false])}
    it {should validate_inclusion_of(:completed).in_array([true, false])}

  end

  describe 'associations' do
    it {should belong_to(:user)}
    it {should have_many(:comments)}
  end

end
