class CreateDisks < ActiveRecord::Migration
  def change
    create_table :disks do |t|

      t.timestamps null: false
    end
  end
end
