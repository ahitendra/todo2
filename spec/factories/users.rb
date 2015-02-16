require 'faker'

FactoryGirl.define do
	factory :user do
		email {Faker::Internet.email}
		#email "pspriancaa25@gmail.com"
		password Faker::Internet.password(8)
	end
end
