require 'spec_helper'

describe SurveyTakensHelper do
  describe "get_question_answer" do
    before (:each) do
      @question = mock(SurveyQuestion)
      @question.stub(:answer).and_return("answer")
      RAILS_ASSET_ID=1
      ActionController::Base.config.asset_path = proc { |asset_path| asset_path }
    end
    it "should render correct question" do
      @question.stub(:is_answer_correct?).and_return(true)
      helper.get_question_answer(@question).should == " <img alt=\"Tick\" src=\"/images/tick.png\" />&nbsp;answer"
    end
    it "should render incorrect question" do
      @question.stub(:is_answer_correct?).and_return(false)
      helper.get_question_answer(@question).should == " <img alt=\"Cross\" src=\"/images/cross.png\" />&nbsp;answer"
    end
  end
end
