require 'spec_helper'
require 'factory_girl'

describe Workshop do
  it "has a valid factory" do
    workshop = FactoryGirl.create(:workshop)
    workshop.should be_valid
  end
  it "is invalid without a duration" do
    FactoryGirl.build(:workshop, duration: nil).should_not be_valid
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

  it "is invalid with wrong duration" do
    FactoryGirl.build(:workshop, duration: 'rrrr_hourly').should_not be_valid
  end
  it "is valid with duration - weekend" do
    FactoryGirl.build(:workshop, duration: 'weekend').should be_valid
  end
  it "is valid with duration - 3 day" do
    FactoryGirl.build(:workshop, duration: '3 day').should be_valid
  end
  it "is valid with duration - 5 day" do
    FactoryGirl.build(:workshop, duration: '5 day').should be_valid
  end


  it "5 day duration should be 5" do
    FactoryGirl.build(:workshop, duration: '5 day').days.should be(5)
  end
  it "3 day duration should be 3" do
    FactoryGirl.build(:workshop, duration: '3 day').days.should be(3)
  end
  it "weekend duration should be 2" do
    FactoryGirl.build(:workshop, duration: 'weekend').days.should be(2)
  end
end
