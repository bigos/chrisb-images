require 'spec_helper'
require 'factory_girl'

describe Workshop do
  it "has a valid factory" do
    workshop = FactoryGirl.create(:workshop)
    workshop.should be_valid
  end
  it "is invalid without a type" do
    FactoryGirl.build(:workshop, type: nil).should_not be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:workshop, title: nil).should_not be_valid
  end
  it "is invalid without a teaser" do
    FactoryGirl.build(:workshop, teaser: nil).should_not be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:workshop, teaser: nil).should_not be_valid
  end

  it "is invalid with wrong type" do
    FactoryGirl.build(:workshop, type: 'rrrr_hourly').should_not be_valid
  end
  it "is valid with type - weekend" do
    FactoryGirl.build(:workshop, type: 'weekend').should be_valid
  end
  it "is valid with type - 3 day" do
    FactoryGirl.build(:workshop, type: '3 day').should be_valid
  end
  it "is valid with type - 5 day" do
    FactoryGirl.build(:workshop, type: '5 day').should be_valid
  end
end
