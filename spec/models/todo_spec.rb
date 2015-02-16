require 'rails_helper'

RSpec.describe Todo, type: :model do
  
  it "is a valid factory" do
  	FactoryGirl.create(:todo).should be_valid
  end

  it "is not valid with out the item" do
  	FactoryGirl.build(:todo, todo_item: nil).should_not be_valid
  end

  it "has a unique title" do
     	FactoryGirl.create(:todo, todo_item: "my todo")
     	t = FactoryGirl.build(:todo, todo_item: "my todo")
     	unless t.valid?
    	 expect(t.errors[:todo_item]).to include("has already been taken")
      end
   end

end
