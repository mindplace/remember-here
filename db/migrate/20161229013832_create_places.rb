class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title, null: false
      t.string :address, null: false

      t.string :website, default: ""

      t.timestamps
    end
  end
end
