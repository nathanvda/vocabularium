class SurveyTakensController < ApplicationController

  before_filter :find_survey_and_question

  def show
    render :action => :next unless @survey_taken.nr_correct.nil?
  end

  def next
    @question.update_attribute(:answer, params[:answer])

    # proceed to next question
    @survey_taken.update_attribute(:current_question, @survey_taken.current_question + 1)
    if @survey_taken.current_question == @survey_taken.nr_questions
      # calculate result of test
      @survey_taken.calculate_result
      if request.xhr?
        render 'next.html', :layout => false
      end
    else
      get_current_question
      if request.xhr?
        render :partial => 'current_question.html', :layout => false
      else
        render :action => 'show', :layout => false
      end
    end
  end


  private

  def find_survey_and_question
    @survey_taken = SurveyTaken.find(params[:id])
    get_current_question
  end

  def get_current_question
    @question = @survey_taken.survey_questions[@survey_taken.current_question]
  end
end
