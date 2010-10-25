require "spec_helper"

describe UserLanguagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/user_languages" }.should route_to(:controller => "user_languages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/user_languages/new" }.should route_to(:controller => "user_languages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/user_languages/1" }.should route_to(:controller => "user_languages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/user_languages/1/edit" }.should route_to(:controller => "user_languages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/user_languages" }.should route_to(:controller => "user_languages", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/user_languages/1" }.should route_to(:controller => "user_languages", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/user_languages/1" }.should route_to(:controller => "user_languages", :action => "destroy", :id => "1")
    end

  end
end
