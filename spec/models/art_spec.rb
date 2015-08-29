require 'rails_helper'

RSpec.describe Art, :type => :model do
   it "has a valid factory" do
    expect(FactoryGirl.create(:art)).to be_valid
  end
end
