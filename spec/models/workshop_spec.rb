require 'spec_helper'

describe Workshop do
  it "has a valid factory" do
    w = FactoryGirl.create(:workshop)
    p w
    w.should be_valid
  end
end
