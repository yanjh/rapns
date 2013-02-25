class Pmessage < ActiveRecord::Base
  attr_accessible :badge, :content, :flag, :pgroup_id, :sound
  
  def add_queue (papp_id)
    pgroup=Pgroup.find(self.pgroup_id)
    if pgroup
      papp=Rapns::Apns::App.find(papp_id)
      if papp
        pgroup.pdevice.each do | device|
          n = Rapns::Apns::Notification.new
          n.app = papp
          n.device_token = device.token
          n.alert = self.content
          n.badge = self.badge
          n.attributes_for_device = {:foo => :bar}
          n.save!          
        end
      end
    end
  end
end
