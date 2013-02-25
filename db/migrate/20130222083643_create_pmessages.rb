class CreatePmessages < ActiveRecord::Migration
  def change
    create_table :pmessages do |t|
      t.integer :pgroup_id
      t.string :content
      t.integer :badge
      t.string :sound
      t.integer :flag

      t.timestamps
    end
  end
end
