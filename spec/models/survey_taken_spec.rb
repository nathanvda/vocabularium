require 'spec_helper'

describe SurveyTaken do
  context "creating from a survey" do
    before(:each) do
      @user = Factory(:user)
      @survey = Factory(:survey, :user_id => @user.id)
      @survey_taken = SuveryTaken.new(@survey)
    end

    it "should create a survey-taken" do
      @survey_taken.should_not be_nil
    end

    it "should contain all the questions" do
      @survey_taken.questions.size.should == 2
    end

    it "should be "
  end
end
