class ChangeColumnBodyInStories < ActiveRecord::Migration
  def change
  	change_column :stories, :body, :text, :limit => nil
  end
end
