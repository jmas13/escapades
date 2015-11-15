class AddUserRefToEscapades < ActiveRecord::Migration
  def change
    add_reference :escapades, :user, index: true, foreign_key: true
  end
end
