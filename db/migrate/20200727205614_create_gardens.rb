class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.string :garden_name
      t.integer :plant_pop
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
