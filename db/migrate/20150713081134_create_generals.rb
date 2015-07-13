class CreateGenerals < ActiveRecord::Migration
  def up
    create_table :generals do |t|
      t.string   "hostname"
      t.string   "os"
      t.string   "uptime"
      t.string   "datetime"
      t.integer  "ipaddress_id"
      t.integer  "cpu_id"
      t.integer  "mem_id"
      t.integer  "disk_id"
      t.integer  "arp_id"
      t.integer  "bandwidth_id"
      t.integer  "io_id"
      t.integer  "load_avg_id"
      t.integer  "process_id"

      t.timestamps null: false
    end
  end

  def down
    drop_table :generals
  end
end
