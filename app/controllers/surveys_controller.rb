class SurveysController < ApplicationController
  before_filter :authenticate_user!

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def edit
    @survey = Packet.find(params[:id])
  end

  def create
    @survey = Survey.new(params[:packet])

    respond_to do |format|
      if @survey.save
        redirect_to(@packet, :notice => 'Test was succesvol aangemaakt.')
      else
        render :action => "new"
      end
    end
  end

  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        redirect_to(@packet, :notice => 'Packet was successfully updated.')
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(packets_url) }
      format.xml  { head :ok }
    end
  end
end
