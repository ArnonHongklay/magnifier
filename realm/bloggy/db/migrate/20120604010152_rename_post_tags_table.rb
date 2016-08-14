class RenamePostTagsTable < ActiveRecord::Migration
  def change
    rename_table :posts_tags, :bloggy_posts_tags
  end
end
