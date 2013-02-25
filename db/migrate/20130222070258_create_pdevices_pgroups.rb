class CreatePdevicesPgroups < ActiveRecord::Migration
  def up
    create_table  :pdevices_pgroups do |t|
	  t.integer :pdevice_id
	  t.integer :pgroup_id
    end
  end

  def down
	#drop_table :pdevices_pgroups
  end
end
