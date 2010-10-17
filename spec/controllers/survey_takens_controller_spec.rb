require 'spec_helper'

describe SurveyTakensController do
  include Devise::TestHelpers

  before :each do
    @user = Factory.create(:user)
    sign_in @user
  end

  def mock_survey_taken(stubs={})
    @mock_survey_taken ||= mock_model(SurveyTaken, stubs).as_null_object
  end


  describe "GET show" do
    it "assigns the requested survey as @survey" do
      mock_survey_question =  mock_model(SurveyQuestion, {}).as_null_object
      SurveyTaken.stub(:find).with("37") { mock_survey_taken(:survey_questions => [mock_survey_question], :current_question => 0, :nr_questions => 1 ) }
      get :show, :id => "37"
      assigns(:survey_taken).should be(@mock_survey_taken)
      assigns(:question).should be(mock_survey_question)
    end
  end

  describe "POST next" do
    it "saves the result" do
      mock_survey_question =  mock_model(SurveyQuestion, {}).as_null_object
      mock_survey_question.should_receive(:update_attribute).with(:answer, 'answer')
      mock_taken = mock_model(SurveyTaken)
      mock_taken.stub(:survey_questions).and_return([mock_survey_question])
      mock_taken.stub(:nr_questions).and_return(1)
      mock_taken.stub(:current_question).and_return(0, 0, 1)
      mock_taken.stub(:update_attribute).with(:current_question, 1)
      SurveyTaken.stub(:find).with("37") { mock_taken }
      mock_taken.should_receive(:calculate_result)
      post :next, :id => '37', :answer => 'answer'
      assigns(:survey_taken).should be(mock_taken)
      assigns(:question).should be(mock_survey_question)
    end


    it "goes to the next question" do
      mock_survey_question =  mock_model(SurveyQuestion, {}).as_null_object
      mock_survey_question2 =  mock_model(SurveyQuestion, {}).as_null_object
      mock_taken = mock_model(SurveyTaken)
      mock_taken.stub(:survey_questions).and_return([mock_survey_question, mock_survey_question2])
      mock_taken.stub(:nr_questions).and_return(2)
      mock_taken.stub(:current_question).and_return(0, 0, 1)
      mock_taken.stub(:update_attribute).with(:current_question, 1)
      SurveyTaken.stub(:find).with("37") { mock_taken }
      post :next, :id => '37', :answer => 'answer'
      assigns(:survey_taken).should be(mock_taken)
      assigns(:question).should be(mock_survey_question2)
    end
  end


end
