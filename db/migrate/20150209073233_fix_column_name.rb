class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :todos, :UserId, :user_id
  end
end
