class RenameContextsTableToFramesTable < ActiveRecord::Migration
  def change
    rename_table :contexts, :frames
  end 
end
