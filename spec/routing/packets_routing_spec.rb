require "spec_helper"

describe PacketsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/packets" }.should route_to(:controller => "packets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/packets/new" }.should route_to(:controller => "packets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/packets/1" }.should route_to(:controller => "packets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/packets/1/edit" }.should route_to(:controller => "packets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/packets" }.should route_to(:controller => "packets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/packets/1" }.should route_to(:controller => "packets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/packets/1" }.should route_to(:controller => "packets", :action => "destroy", :id => "1")
    end

  end
end
