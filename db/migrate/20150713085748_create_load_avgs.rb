class CreateLoadAvgs < ActiveRecord::Migration
  def change
    create_table :load_avgs do |t|

      t.timestamps null: false
    end
  end
end
