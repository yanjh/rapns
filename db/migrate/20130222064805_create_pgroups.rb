class CreatePgroups < ActiveRecord::Migration
  def change
    create_table :pgroups do |t|
      t.string :name
      t.text :description
      t.integer :papp_id
      t.integer :flag

      t.timestamps
    end
  end
end
