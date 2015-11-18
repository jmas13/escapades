class CreateAvailability < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :response, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
