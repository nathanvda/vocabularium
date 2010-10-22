require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'manual'" do
    it "should be successful" do
      get 'manual'
      response.should be_success
    end
  end

  describe 'current_tab' do
    it "returns :root" do
      controller.current_tab.should == :root
    end
  end

end
