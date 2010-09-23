class SurveyTakensController < ApplicationController

  def show
    @survey_taken = SurveyTaken.find(params[:id])
    @question = @survey_taken.survey_questions[@survey_taken.current_question]
  end

  def next

  end

end
