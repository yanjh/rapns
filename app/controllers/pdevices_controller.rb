class PdevicesController < ApplicationController
  # GET /pdevices
  # GET /pdevices.json
  def index
    @pdevices = Pdevice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pdevices }
    end
  end

  # GET /pdevices/1
  # GET /pdevices/1.json
  def show
    @pdevice = Pdevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pdevice }
    end
  end

  # GET /pdevices/new
  # GET /pdevices/new.json
  def new
    @pdevice = Pdevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pdevice }
    end
  end

  # GET /pdevices/1/edit
  def edit
    @pdevice = Pdevice.find(params[:id])
  end

  # POST /pdevices
  # POST /pdevices.json
  def create
    
    if params[:pdevice_token]
      if @pdevice=Pdevice.find_by_token(params[:pdevice_token])
        @pdevice.user = params[:pdevice_user]
      else
        @pdevice = Pdevice.new(:token=>params[:pdevice_token],:user=>params[:pdevice_user])
      end
    else
      @pdevice = Pdevice.new(params[:pdevice])
    end

    respond_to do |format|
      if @pdevice.save
        format.html { redirect_to  @pdevice, notice: 'Pdevice was successfully created.' }
        format.json { render json: @pdevice, status: :created, location: @pdevice }
      else
        format.html { render action: "new" }
        format.json { render json: @pdevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pdevices/1
  # PUT /pdevices/1.json
  def update
    @pdevice = Pdevice.find(params[:id])

    respond_to do |format|
      if @pdevice.update_attributes(params[:pdevice])
        format.html { redirect_to @pdevice, notice: 'Pdevice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pdevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdevices/1
  # DELETE /pdevices/1.json
  def destroy
    @pdevice = Pdevice.find(params[:id])
    @pdevice.destroy

    respond_to do |format|
      format.html { redirect_to pdevices_url }
      format.json { head :no_content }
    end
  end
end
