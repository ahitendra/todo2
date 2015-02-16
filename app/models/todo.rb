class Todo < ActiveRecord::Base
	#attr_accessible :todo_item, :completed
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :todo_item, presence: true
	validates :todo_item, :uniqueness => {:message => "has already been taken"}
	validates :todo_item, length: { minimum: 2}
	validates :todo_item, length: { maximum: 40 }
end
