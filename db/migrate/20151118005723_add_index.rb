class AddIndex < ActiveRecord::Migration
  def change
    add_index :responses, [:user_id, :escapade_id], unique: true
  end
end
