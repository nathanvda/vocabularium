class PacketsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @packets = Packet.all
  end

  def show
    @packet = Packet.find(params[:id])
  end

  def new
    @packet = Packet.new
    @packet.words.build
  end

  def edit
    @packet = Packet.find(params[:id])
  end

  def create
    @packet = Packet.new(params[:packet])

    if @packet.save
      redirect_to(@packet, :notice => 'Woordenlijst aangemaakt.')
    else
      render :action => "new"
    end
  end

  def update
    @packet = Packet.find(params[:id])

    if @packet.update_attributes(params[:packet])
      redirect_to(@packet, :notice => 'Woordenlijst is aangepast.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @packet = Packet.find(params[:id])
    @packet.destroy

    redirect_to(packets_url)
  end
end
