class MoveUserIdToPost < ActiveRecord::Migration
  class Bloggy::PostsRevision < ActiveRecord::Base
  end

  class Bloggy::Post < ActiveRecord::Base
    has_many :posts_revisions
  end

  def up
    add_column :bloggy_posts, :user_id, :integer
    Bloggy::Post.reset_column_information
    Bloggy::Post.all.each do |post|
      post.user_id = post.posts_revisions.first.user_id
      post.save(validate: false)
    end
    remove_column :bloggy_posts_revisions, :user_id
  end

  def down
    add_column :bloggy_posts_revisions, :user_id, :integer
    Bloggy::Post.reset_column_information
    Bloggy::Post.all.each do |post|
      post.posts_revisions.each do |revision|
        revision.user_id = post.user_id
        revision.save!
      end
    end
    remove_column :bloggy_posts, :user_id
  end
end
