require 'spec_helper'

describe UserLanguagesController do
  include Devise::TestHelpers

  before :each do
    @user = Factory.create(:user)
    sign_in @user
  end

  def mock_user_language(stubs={})
    @mock_user_language ||= mock_model(UserLanguage, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all user_languages as @user_languages" do
      UserLanguage.stub(:owned_by) { [mock_user_language] }
      get :index
      assigns(:user_languages).should eq([mock_user_language])
    end
  end

  describe "GET show" do
    it "assigns the requested user_language as @user_language" do
      UserLanguage.stub(:find).with("37") { mock_user_language }
      get :show, :id => "37"
      assigns(:user_language).should be(mock_user_language)
    end
  end

  describe "GET new" do
    it "assigns a new user_language as @user_language" do
      UserLanguage.stub(:new) { mock_user_language }
      get :new
      assigns(:user_language).should be(mock_user_language)
    end
  end

  describe "GET edit" do
    it "assigns the requested user_language as @user_language" do
      UserLanguage.stub(:find).with("37") { mock_user_language }
      get :edit, :id => "37"
      assigns(:user_language).should be(mock_user_language)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created user_language as @user_language" do
        UserLanguage.stub(:new).with({'these' => 'params'}) { mock_user_language(:save => true) }
        post :create, :user_language => {'these' => 'params'}
        assigns(:user_language).should be(mock_user_language)
      end

      it "redirects to the created user_language" do
        UserLanguage.stub(:new) { mock_user_language(:save => true) }
        post :create, :user_language => {}
        response.should redirect_to(user_language_url(mock_user_language))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user_language as @user_language" do
        UserLanguage.stub(:new).with({'these' => 'params'}) { mock_user_language(:save => false) }
        post :create, :user_language => {'these' => 'params'}
        assigns(:user_language).should be(mock_user_language)
      end

      it "re-renders the 'new' template" do
        UserLanguage.stub(:new) { mock_user_language(:save => false) }
        post :create, :user_language => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested user_language" do
        UserLanguage.should_receive(:find).with("37") { mock_user_language }
        mock_user_language.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user_language => {'these' => 'params'}
      end

      it "assigns the requested user_language as @user_language" do
        UserLanguage.stub(:find) { mock_user_language(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:user_language).should be(mock_user_language)
      end

      it "redirects to the user_language" do
        UserLanguage.stub(:find) { mock_user_language(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(user_language_url(mock_user_language))
      end
    end

    describe "with invalid params" do
      it "assigns the user_language as @user_language" do
        UserLanguage.stub(:find) { mock_user_language(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:user_language).should be(mock_user_language)
      end

      it "re-renders the 'edit' template" do
        UserLanguage.stub(:find) { mock_user_language(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested user_language" do
      UserLanguage.should_receive(:find).with("37") { mock_user_language }
      mock_user_language.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the user_languages list" do
      UserLanguage.stub(:find) { mock_user_language }
      delete :destroy, :id => "1"
      response.should redirect_to(user_languages_url)
    end
  end

end
