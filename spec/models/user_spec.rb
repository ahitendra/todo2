require 'rails_helper'

RSpec.describe User, type: :model do

  it "is a valid factory" do
	FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without an eamail" do
	FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "is valid with a email" do
    FactoryGirl.build(:user, email: "hitendra@gmail.com").should be_valid
  end

  it "is invalid with a duplicate email address" do
 	FactoryGirl.create(:user, email: "hello@example.com")
 	p = FactoryGirl.build(:user, email: "hello@example.com")
 	unless p.valid?
    	expect(p.errors[:email]).to include("has already been taken")
    end
  end

end
