# This migration comes from bloggy (originally 20120612020023)
class AddIndexToTagName < ActiveRecord::Migration
  def change
    add_index :bloggy_tags, :name
  end
end
