class CreateEscapades < ActiveRecord::Migration
  def change
    create_table :escapades do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :activity
      t.string :description
      t.string :image
      t.string :status
      t.timestamps null: false      
    end
  end
end
