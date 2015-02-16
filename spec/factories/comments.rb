require 'faker'

FactoryGirl.define do
  factory :comment do
    user_id  1
    todo_id  1
    #user=User.find(1)
    #:comment.Commenter = user.full_name
  	# sequence :title do |n|
   #  	"helloworld#{n}"
  	# end
	#title "MyString"
	#content "MyText"
		#user_id '1' 	#Faker::Number.digit
		#title 'this is my post'
		#text 'the many likes on it'
		body Faker::Lorem.characters(40)
		#todo_item Faker::Lorem.characters(39)
		#title Faker::Lorem.characters(4)
		#text Faker::Lorem.characters(9)
  end

end