class ChangeColumnBodyInThoughts < ActiveRecord::Migration
    def change
  	change_column :thoughts, :body, :text, :limit => nil
  end
end
