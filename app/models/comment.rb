class Comment < ActiveRecord::Base
  belongs_to :todo
  belongs_to :user
  validates :body, :presence => true
  validates :body, length: {maximum: 40, message: "title length must be smaller than 41 characters"}
  validates :body, length: {minimum: 4 , message: "title length must be greater than 4 characters"}
end
