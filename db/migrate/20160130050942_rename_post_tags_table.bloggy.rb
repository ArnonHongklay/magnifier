# This migration comes from bloggy (originally 20120604010152)
class RenamePostTagsTable < ActiveRecord::Migration
  def change
    rename_table :posts_tags, :bloggy_posts_tags
  end
end
