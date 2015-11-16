class CreateEscapades < ActiveRecord::Migration
  def change
    create_table :escapades do |t|
      t.string :title, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :location
      t.string :activity
      t.string :description
      t.string :image, default: "http://www.outdoorfitnessisrael.co.il/wp-content/themes/envision-v1/lib/images/default-placeholder-960x540.png"
      t.string :status, default: "idea"
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
