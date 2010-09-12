class PacketsController < ApplicationController
  before_filter :authenticate_user!

  # GET /packets
  # GET /packets.xml
  def index
    @packets = Packet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @packets }
    end
  end

  # GET /packets/1
  # GET /packets/1.xml
  def show
    @packet = Packet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @packet }
    end
  end

  # GET /packets/new
  # GET /packets/new.xml
  def new
    @packet = Packet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @packet }
    end
  end

  # GET /packets/1/edit
  def edit
    @packet = Packet.find(params[:id])
  end

  # POST /packets
  # POST /packets.xml
  def create
    @packet = Packet.new(params[:packet])

    respond_to do |format|
      if @packet.save
        format.html { redirect_to(@packet, :notice => 'Packet was successfully created.') }
        format.xml  { render :xml => @packet, :status => :created, :location => @packet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @packet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /packets/1
  # PUT /packets/1.xml
  def update
    @packet = Packet.find(params[:id])

    respond_to do |format|
      if @packet.update_attributes(params[:packet])
        format.html { redirect_to(@packet, :notice => 'Packet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @packet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /packets/1
  # DELETE /packets/1.xml
  def destroy
    @packet = Packet.find(params[:id])
    @packet.destroy

    respond_to do |format|
      format.html { redirect_to(packets_url) }
      format.xml  { head :ok }
    end
  end
end
