class CreateBloggyTags < ActiveRecord::Migration
  def change
    create_table :bloggy_tags do |t|
      t.string :name

    end
  end
end
