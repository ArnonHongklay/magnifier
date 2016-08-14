# This migration comes from bloggy (originally 20120514164158)
class CreateBloggyTags < ActiveRecord::Migration
  def change
    create_table :bloggy_tags do |t|
      t.string :name

    end
  end
end
