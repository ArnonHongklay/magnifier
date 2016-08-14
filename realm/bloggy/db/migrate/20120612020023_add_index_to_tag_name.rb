class AddIndexToTagName < ActiveRecord::Migration
  def change
    add_index :bloggy_tags, :name
  end
end
