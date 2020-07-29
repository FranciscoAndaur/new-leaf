class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content

      t.belongs_to :plant, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :start_date
      t.integer :days_completed, default: 0

      t.timestamps
    end
  end
end
