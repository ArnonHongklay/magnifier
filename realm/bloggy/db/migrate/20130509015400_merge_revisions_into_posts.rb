class MergeRevisionsIntoPosts < ActiveRecord::Migration
  class Bloggy::PostsRevision < ActiveRecord::Base
  end

  class Bloggy::Post < ActiveRecord::Base
  end

  def up
    Bloggy::Post.reset_column_information
    add_column :bloggy_posts, :title, :string
    add_column :bloggy_posts, :content, :text
    add_column :bloggy_posts, :url, :string
    add_column :bloggy_posts, :published_at, :datetime
    remove_column :bloggy_posts, :posts_revision_id
    add_index :bloggy_posts, :url, unique: true

    Bloggy::Post.reset_column_information

    Bloggy::Post.all.each do |post|
      latest_revision =  latest_revision_for(post)
      post.title =latest_revision.title
      post.content =latest_revision.content
      post.url =latest_revision.url
      post.published_at =latest_revision.published_at
      post.save(validate: false)
    end

    drop_table :bloggy_posts_revisions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private
  def latest_revision_for(post)
    Bloggy::PostsRevision.where("post_id = ?", post.id).order("bloggy_posts_revisions.updated_at DESC").limit(1).first
  end
end
