class Pgroup < ActiveRecord::Base
  attr_accessible :description, :flag, :name, :papp_id
  
  belongs_to :papp, :foreign_key=>"papp_id"
  has_and_belongs_to_many :pdevice
  #has_many :pmessage
  
  def other_device
	Pdevice.where("id not in(select pdevice_id from pdevices_pgroups where pgroup_id=?)",self.id);
  end
end
