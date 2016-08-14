# This migration comes from bloggy (originally 20120526131841)
class MigrateOldUrls < ActiveRecord::Migration
  class Bloggy::PostsRevision < ActiveRecord::Base
  end

  def up
    mount_point = Bloggy::Engine.routes.url_helpers.root_path
    Bloggy::PostsRevision.all.each do |r|
      next if r.url.nil?
      r.url = r.url.sub(mount_point, "")
      r.save!
    end
  end

  def down
    mount_point = Bloggy::Engine.routes.url_helpers.root_path
    Bloggy::PostsRevision.all.each do |r|
      next if r.url.nil?
      r.url = mount_point + r.url
      r.save!
    end
  end
end
