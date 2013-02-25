class AppsController < ApplicationController

  def index
    @apps = Rapns::Apns::App.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pgroups }
    end
  end
  
  def show
    @papp = Rapns::Apns::App.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @app }
    end
  end
  
  def new
    @papp = Rapns::Apns::App.new
	#@papps  = Papp.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @papp }
    end
  end
  
  def edit
    @papp = Rapns::Apns::App.find(params[:id])
  end

  # POST /pgroups
  # POST /pgroups.json
  def create
    @papp = Rapns::Apns::App.new(params[:rapns_apns_app])
    @papp.certificate=@papp.certificate.gsub(/\r\n?/,"\n")

    respond_to do |format|
      if @papp.save!
        format.html { redirect_to apps_path, notice: 'App was successfully created.' }
        format.json { render json: @papp, status: :created, location: @papp }
      else
        format.html { render action: "new" }
        format.json { render json: @papp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pgroups/1
  # PUT /pgroups/1.json
  def update
    @papp = Rapns::Apns::App.find(params[:id])
	params[:rapns_apns_app][:certificate]=params[:rapns_apns_app][:certificate].gsub(/\r\n?/,"\n")
    respond_to do |format|
      if @papp.update_attributes(params[:rapns_apns_app])
        format.html { redirect_to apps_path, notice: 'App was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @papp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pgroups/1
  # DELETE /pgroups/1.json
  def destroy
    @papp = Rapns::Apns::App.find(params[:id])
    @papp.destroy

    respond_to do |format|
      format.html { redirect_to apps_url }
      format.json { head :no_content }
    end
  end



end
