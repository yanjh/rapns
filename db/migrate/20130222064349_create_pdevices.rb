class CreatePdevices < ActiveRecord::Migration
  def change
    create_table :pdevices do |t|
      t.text :token
      t.string :user
      t.integer :flag

      t.timestamps
    end
  end
end
