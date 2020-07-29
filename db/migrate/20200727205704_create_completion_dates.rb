class CreateCompletionDates < ActiveRecord::Migration[6.0]
  def change
    create_table :completion_dates do |t|
      t.datetime :date
      t.belongs_to :task, null: false, foreign_key: true
  
      t.timestamps
    end
  end
end
