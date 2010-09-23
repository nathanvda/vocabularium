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
       @survey_taken.nr_correct.should == 0
    end
    it "should be have correctly set current question" do
      @survey_taken.current_question.should == 0
    end

  end
end
