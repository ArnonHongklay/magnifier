class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :bloggy_taggings do |t|
      t.integer :post_id, :tag_id
    end

    add_index :bloggy_taggings, :post_id
    add_index :bloggy_taggings, :tag_id

  end
end
