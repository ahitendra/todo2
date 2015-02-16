require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is a valid factory" do
  	FactoryGirl.create.(:comment, :Commenter).should be_valid
  end
  it "is not valid with out comment" do
  	FactoryGirl.build.(:commet, body: nil).should_not be_valid
  end

  it "is invalid if comment longer than 40 characters" do
  	FactoryGirl.build(:comment, body: Faker::Lorem.characters(41)).should_not be_valid
  end

  it "is invalid if comment is less than 4 characters" do
  	FactoryGirl.build(:comment, body: Faker::Lorem.characters(2)).should_not be_valid
  end

  	
end
