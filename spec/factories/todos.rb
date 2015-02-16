require 'faker'

FactoryGirl.define do
  factory :todo do
    user_id 1
  	# sequence :title do |n|
   #  	"helloworld#{n}"
  	# end
	#title "MyString"
	#content "MyText"
		#user_id '1' 	#Faker::Number.digit
		#title 'this is my post'
		#text 'the many likes on it'
		todo_item Faker::Lorem.characters(40)
		#todo_item Faker::Lorem.characters(39)
		#title Faker::Lorem.characters(4)
		#text Faker::Lorem.characters(9)
  end

end