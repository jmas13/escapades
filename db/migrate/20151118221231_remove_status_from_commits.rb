class RemoveStatusFromCommits < ActiveRecord::Migration
  def change
    remove_column :commits, :status, :boolean
  end
end
