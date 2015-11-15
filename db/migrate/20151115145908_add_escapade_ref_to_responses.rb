class AddEscapadeRefToResponses < ActiveRecord::Migration
  def change
    add_reference :responses, :escapade, index: true, foreign_key: true
  end
end
