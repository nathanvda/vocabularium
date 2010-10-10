class SurveysController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_survey, :only => [:show, :edit, :update, :destroy]

  def index
    @surveys = Survey.owned_by(current_user)
  end

  def show
  end

  def new
    @survey = Survey.new
    @packets = Packet.owned_by(current_user)
  end

  def edit
    @packets = Packet.owned_by(current_user)
  end

  def create
    @survey = Survey.new(params[:survey])
    @survey.user_id = current_user.id

    if @survey.save
      redirect_to(surveys_path, :notice => 'Test was succesvol aangemaakt.')
    else
      @packets = Packet.owned_by(current_user)
      render :action => "new"
    end
  end

  def update
    if @survey.update_attributes(params[:survey])
      redirect_to(@survey, :notice => 'Test is gewijzigd.')
    else
      render :action => "edit"
    end
  end


  def destroy
    Survey.delete(params[:id])
    redirect_to(surveys_url, :notice => 'Test is verwijderd.')
  end

  def take
    survey = Survey.find(params[:id])
    test = SurveyTaken.prepare_test(survey)
    redirect_to survey_taken_path(test)
  end

  private

  def find_survey
    @survey = Survey.find(params[:id])
  end

end
