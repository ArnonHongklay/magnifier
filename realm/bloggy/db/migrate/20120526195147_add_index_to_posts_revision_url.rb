class AddIndexToPostsRevisionUrl < ActiveRecord::Migration
  def change
    add_index :bloggy_posts_revisions, :url
  end
end
