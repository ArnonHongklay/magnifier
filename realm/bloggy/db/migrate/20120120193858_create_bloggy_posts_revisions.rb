class CreateBloggyPostsRevisions < ActiveRecord::Migration
  def change
    create_table :bloggy_posts_revisions do |t|
      t.string :title
      t.text :content
      t.string :url
      t.integer :user_id
      t.integer :post_id
      t.datetime :published_at

      t.timestamps
    end

    add_index :bloggy_posts_revisions, :id, unique: true
    add_index :bloggy_posts_revisions, :published_at
    add_index :bloggy_posts_revisions, :post_id
  end
end
