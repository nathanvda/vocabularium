class PacketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_packet, :only => [:show, :edit, :update, :destroy]

  def index
    @packets = Packet.owned_by(current_user)
  end

  def show
  end

  def new
    @packet = Packet.new
    @packet.words.build
  end

  def edit
  end

  def create
    @packet = Packet.new(params[:packet])
    @packet.user_id = current_user.id

    if @packet.save
      redirect_to(@packet, :notice => 'Woordenlijst aangemaakt.')
    else
      render :action => "new"
    end
  end

  def update
    if @packet.update_attributes(params[:packet])
      redirect_to(@packet, :notice => 'Woordenlijst is aangepast.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @packet.destroy

    redirect_to(packets_url)
  end


  private


  def find_packet
    @packet = Packet.owned_by(current_user).find(params[:id])
  end
end
