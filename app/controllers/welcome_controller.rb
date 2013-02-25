class WelcomeController < ApplicationController
  def index
    #@apps = Rapns::Apns::App.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pgroups }
    end
  end
  
  def notify_list
    @notifies = Rapns::Apns::Notification.order("created_at desc").limit(100)

    respond_to do |format|
      format.html 
      format.json { render json: @notifies }
    end
  end
  
  def notify_clear
    notifies = Rapns::Apns::Notification.delete_all
    
    #notifies.each do |notify|
    #  notify.delete
    #end

    respond_to do |format|
      format.html { redirect_to welcome_notify_list_path }
      format.json { render json: @notifies }
    end
  end
  
end
