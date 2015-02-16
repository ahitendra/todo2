class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo_item
      t.boolean :completed
      t.timestamps
    end
  end
end
