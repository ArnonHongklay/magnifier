# This migration comes from bloggy (originally 20120526195147)
class AddIndexToPostsRevisionUrl < ActiveRecord::Migration
  def change
    add_index :bloggy_posts_revisions, :url
  end
end
