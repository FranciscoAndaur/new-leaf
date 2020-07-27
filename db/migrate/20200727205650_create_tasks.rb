class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :water
      t.boolean :sunlight, :default => false
      t.boolean :affection, :default => false
      t.belongs_to :plant, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
