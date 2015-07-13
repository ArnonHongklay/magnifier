class CreateArps < ActiveRecord::Migration
  def up
    create_table :arps do |t|
      t.string "address"
      t.string "hw_type"
      t.string "hw_address"
      t.string "flags"
      t.string "mask"

      t.timestamps null: false
    end
  end

  def down
    drop_table :arps
  end
end
