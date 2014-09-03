class CreateThoughts < ActiveRecord::Migration
  def change 
  	create_table :thoughts do |t|
  		t.string :body

  		t.timestamps
  	end
  end
end
