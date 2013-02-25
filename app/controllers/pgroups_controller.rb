class PgroupsController < ApplicationController
  # GET /pgroups
  # GET /pgroups.json
  def index
    @pgroups = Pgroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pgroups }
    end
  end

  # GET /pgroups/1
  # GET /pgroups/1.json
  def show
    @pgroup = Pgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pgroup }
    end
  end

  # GET /pgroups/new
  # GET /pgroups/new.json
  def new
    @pgroup = Pgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pgroup }
    end
  end

  # GET /pgroups/1/edit
  def edit
    @pgroup = Pgroup.find(params[:id])
  end

  # POST /pgroups
  # POST /pgroups.json
  def create
    @pgroup = Pgroup.new(params[:pgroup])

    respond_to do |format|
      if @pgroup.save
        format.html { redirect_to @pgroup, notice: 'Pgroup was successfully created.' }
        format.json { render json: @pgroup, status: :created, location: @pgroup }
      else
        format.html { render action: "new" }
        format.json { render json: @pgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pgroups/1
  # PUT /pgroups/1.json
  def update
    @pgroup = Pgroup.find(params[:id])

    respond_to do |format|
      if @pgroup.update_attributes(params[:pgroup])
        format.html { redirect_to @pgroup, notice: 'Pgroup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pgroups/1
  # DELETE /pgroups/1.json
  def destroy
    @pgroup = Pgroup.find(params[:id])
    @pgroup.destroy

    respond_to do |format|
      format.html { redirect_to pgroups_url }
      format.json { head :no_content }
    end
  end
  
  def device
	@pgroup = Pgroup.find(params[:id])
  end

  def add_device
	pdevice = Pdevice.find(params[:device])
	@pgroup = Pgroup.find(params[:id])

	@pgroup.pdevice << pdevice
	respond_to do |format|
        format.html { redirect_to device_pgroup_path(@pgroup) }
        format.json { head :no_content }
    end
  end

  def remove_device
	@pgroup = Pgroup.find(params[:id])

	pdevice = @pgroup.pdevice.find(params[:device])
	if pdevice
		@pgroup.pdevice.delete(pdevice)
	end 
	
	respond_to do |format|
        format.html { redirect_to device_pgroup_path(@pgroup) }
        format.json { head :no_content }
    end
  end
  
  def new_msg
    @pgroup = Pgroup.find(params[:id])
    @papp = Rapns::Apns::App.find(@pgroup.papp_id)
    @pmessage = Pmessage.new
    @pmessage.badge=1
  end

  def send_msg
    @pgroup = Pgroup.find(params[:id])
    @pmessage = Pmessage.new(params[:pmessage])
    @pmessage.pgroup_id=@pgroup.id
        
    respond_to do |format|
      if @pmessage.save
        @pmessage.add_queue(@pgroup.papp_id)
        format.html { redirect_to @pgroup, notice: 'Message was successfully push to send.' }
        format.json { render json: @pgroup, status: :created, location: @pgroup }
      else
        @papp = Rapns::Apns::App.find(@pgroup.papp_id)
        format.html { render action: "new_msg" }
        format.json { render json: @pgroup.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
end
