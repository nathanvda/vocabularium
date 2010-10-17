require 'spec_helper'

describe SurveysController do
  include Devise::TestHelpers

  before :each do
    @user = Factory.create(:user)
    sign_in @user
  end

  def mock_survey(stubs={})
    @mock_survey ||= mock_model(Survey, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all surveys as @surveys" do
      Survey.stub(:owned_by) { [mock_survey] }
      get :index
      assigns(:surveys).should eq([mock_survey])
    end
  end

  describe "GET show" do
    it "assigns the requested survey as @survey" do
      Survey.stub(:find).with("37") { mock_survey }
      get :show, :id => "37"
      assigns(:survey).should be(mock_survey)
    end
  end

  describe "GET new" do
    it "assigns a new survey as @survey" do
      Survey.stub(:new) { mock_survey }
      get :new
      assigns(:survey).should be(mock_survey)
    end
  end

  describe "GET edit" do
    it "assigns the requested survey as @survey" do
      Survey.stub(:find).with("37") { mock_survey }
      get :edit, :id => "37"
      assigns(:survey).should be(mock_survey)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created survey as @survey" do
        Survey.stub(:new).with({'these' => 'params'}) { mock_survey(:save => true) }
        post :create, :survey => {'these' => 'params'}
        assigns(:survey).should be(mock_survey)
      end

      it "redirects to the created survey" do
        Survey.stub(:new) { mock_survey(:save => true) }
        post :create, :survey => {}
        response.should redirect_to(surveys_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved survey as @survey" do
        Survey.stub(:new).with({'these' => 'params'}) { mock_survey(:save => false) }
        post :create, :survey => {'these' => 'params'}
        assigns(:survey).should be(mock_survey)
      end

      it "re-renders the 'new' template" do
        Survey.stub(:new) { mock_survey(:save => false) }
        post :create, :survey => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested survey" do
        Survey.stub(:find).with("37") { mock_survey }
        mock_survey.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :survey => {'these' => 'params'}
      end

      it "assigns the requested survey as @survey" do
        Survey.stub(:find) { mock_survey(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:survey).should be(mock_survey)
      end

      it "redirects to the survey" do
        Survey.stub(:find) { mock_survey(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(survey_url(mock_survey))
      end
    end

    describe "with invalid params" do
      it "assigns the survey as @survey" do
        Survey.stub(:find) { mock_survey(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:survey).should be(mock_survey)
      end

      it "re-renders the 'edit' template" do
        Survey.stub(:find) { mock_survey(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested survey" do
      Survey.stub(:find) { mock_survey }
      Survey.should_receive(:delete).with("37")
      delete :destroy, :id => "37"
    end

    it "redirects to the packets list" do
      Survey.stub(:find) { mock_survey }
      delete :destroy, :id => "1"
      response.should redirect_to(surveys_url)
    end
  end

end
