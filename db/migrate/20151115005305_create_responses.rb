class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :comment
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :user, index: true, foreign_key: true
      t.references :escapade, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
