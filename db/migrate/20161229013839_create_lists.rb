class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.text :description, default: ""

      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
