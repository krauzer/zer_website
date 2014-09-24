class AddDayColumnToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :day, :date
  end
end
