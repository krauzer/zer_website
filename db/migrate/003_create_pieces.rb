class CreatePieces < ActiveRecord::Migration
  def change 
  	create table :pieces do |t|
  		t.string :body 
  		t.string :addition 
  		t.references :topic

  		t.timestamps 
  	end
  end
end
