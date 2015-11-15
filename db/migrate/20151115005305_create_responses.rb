class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :comment
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end
  end
end
