class CreateListPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :list_places do |t|
      t.references :list, foreign_key: true
      t.references :place, foreign_key: true

      t.text :notes, default: ""
      
      t.timestamps
    end
  end
end
