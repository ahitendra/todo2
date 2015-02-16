class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :Commenter
      t.text :body
      t.references :todo, index: true

      t.timestamps
    end
  end
end
