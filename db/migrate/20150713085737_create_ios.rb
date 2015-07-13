class CreateIos < ActiveRecord::Migration
  def change
    create_table :ios do |t|

      t.timestamps null: false
    end
  end
end
