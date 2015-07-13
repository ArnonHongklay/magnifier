class CreateBandwidths < ActiveRecord::Migration
  def up
    create_table :bandwidths do |t|
      t.string "interface"
      t.string "tx"
      t.string "rx"
      t.timestamps null: false
    end
  end

  def down
    drop_table :bandwidths
  end
end
