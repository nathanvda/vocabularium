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
    @packets = Packet.owned_by(current_user)
  end

  def edit
    @survey = Survey.find(params[:id])
    @packets = Packet.owned_by(current_user)
  end

  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        redirect_to(surveys_path, :notice => 'Test was succesvol aangemaakt.')
      else
        render :action => "new"
      end
    end
  end

  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        redirect_to(@survey, :notice => 'Test is gewijzigd.')
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
    end
  end

  def take
    survey = Survey.find(params[:id])
    test = SurveyTaken.prepare_test(survey)
    redirect_to survey_taken_path(test)
  end
end
