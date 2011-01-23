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
        @word1 = Factory(:word, :translation => "pair")
        @question1 = Factory(:survey_question, :answer => "pair", :word_id => @word1.id, :survey_taken_id => @survey_taken.id)
        @word2 = Factory(:word, :translation => "paaaaar")
        @question2 = Factory(:survey_question, :answer => "paiiiiiir", :word_id => @word2.id, :survey_taken_id => @survey_taken.id)
        mock_questions_array = mock(Array)
        mock_questions_array.stub(:all).and_return([@question1, @question2])
        @survey_taken.stub(:survey_questions).and_return(mock_questions_array)
        @survey_taken.calculate_result
        @survey_taken.nr_correct.should == 1
        @survey_taken.score.should == 50.0
      end
    end

    it "should create a survey-taken from a survey"

  end
end
