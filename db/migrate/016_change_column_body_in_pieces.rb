class ChangeColumnBodyInPieces < ActiveRecord::Migration
    def change
  	change_column :pieces, :body, :text, :limit => nil
  end
end
