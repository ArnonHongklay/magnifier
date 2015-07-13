class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|

      t.timestamps null: false
    end
  end
end
