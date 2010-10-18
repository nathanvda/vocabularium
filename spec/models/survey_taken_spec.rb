require 'spec_helper'

describe SurveyTaken do
  context "creating from a survey" do
    before(:each) do
      @user = Factory(:user)
      @survey = Factory(:survey, :user_id => @user.id)
      @survey_taken = SurveyTaken.prepare_test(@survey)
    end

    it "should create a survey-taken" do
      @survey_taken.should_not be_nil
    end

    it "should contain all the questions" do
      @survey_taken.survey_questions.size.should == 2
    end

    it "should be have correctly set nr questions" do
      @survey_taken.nr_questions.should == 2
    end
    it "should be have correctly set nr correct" do
       @survey_taken.nr_correct.should be_nil
    end
    it "should be have correctly set current question" do
      @survey_taken.current_question.should == 0
    end

    context "calculating the result" do
      it "should calculate the result" do
        mock_question1 = mock(SurveyQuestion)
        mock_question1.stub(:is_correct?).and_return(true)
        mock_question2 = mock(SurveyQuestion)
        mock_question2.stub(:is_correct?).and_return(false)
        mock_questions_array = mock(Array)
        mock_questions_array.stub(:all).and_return([mock_question1, mock_question2])
        @survey_taken.stub(:survey_questions).and_return(mock_questions_array)
        @survey_taken.calculate_result
        @survey_taken.nr_correct.should == 1
        @survey_taken.score.should == 50.0
      end
    end

    it "should create a survey-taken from a survey"

  end
end
