class PmessagesController < ApplicationController
  # GET /pmessages
  # GET /pmessages.json
  def index
    @pmessages = Pmessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pmessages }
    end
  end

  # GET /pmessages/1
  # GET /pmessages/1.json
  def show
    @pmessage = Pmessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pmessage }
    end
  end

  # GET /pmessages/new
  # GET /pmessages/new.json
  def new
    @pmessage = Pmessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pmessage }
    end
  end

  # GET /pmessages/1/edit
  def edit
    @pmessage = Pmessage.find(params[:id])
  end

  # POST /pmessages
  # POST /pmessages.json
  def create
    @pmessage = Pmessage.new(params[:pmessage])

    respond_to do |format|
      if @pmessage.save
        format.html { redirect_to @pmessage, notice: 'Pmessage was successfully created.' }
        format.json { render json: @pmessage, status: :created, location: @pmessage }
      else
        format.html { render action: "new" }
        format.json { render json: @pmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pmessages/1
  # PUT /pmessages/1.json
  def update
    @pmessage = Pmessage.find(params[:id])

    respond_to do |format|
      if @pmessage.update_attributes(params[:pmessage])
        format.html { redirect_to @pmessage, notice: 'Pmessage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pmessages/1
  # DELETE /pmessages/1.json
  def destroy
    @pmessage = Pmessage.find(params[:id])
    @pmessage.destroy

    respond_to do |format|
      format.html { redirect_to pmessages_url }
      format.json { head :no_content }
    end
  end
end
