class Notis < ActiveRecord::Migration
  def change
    create_table :notificats do |t|
      t.belongs_to  :account,   index: true
      t.string      :subject
      t.string      :body

      t.timestamps null: false
    end
  end
end
