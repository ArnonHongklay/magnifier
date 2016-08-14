# This migration comes from bloggy (originally 20120612015727)
class DeleteJoinPostsTags < ActiveRecord::Migration
  def up
    drop_table :bloggy_posts_tags
  end

  def down
    create_table :bloggy_posts_tags, id:false do |t|
      t.integer :post_id,:tag_id
    end
  end
end
