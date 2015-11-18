class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.boolean :status, null: false
      t.references :user, index: true, foreign_key: true
      t.references :escapade, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
