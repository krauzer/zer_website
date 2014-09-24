class AddDayColumnToThoughts < ActiveRecord::Migration
  def change
    add_column :thoughts, :day, :date
  end
end
