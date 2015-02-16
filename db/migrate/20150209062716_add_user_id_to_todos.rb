class AddUserIdToTodos < ActiveRecord::Migration
  def change
  	add_column :todos, :UserId, :interger
  end
end
