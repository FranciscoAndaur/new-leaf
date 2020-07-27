class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :plant_type
      t.string :nickname
      t.integer :size
      t.integer :water_ammount
      t.belongs_to :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
