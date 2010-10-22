require 'spec_helper'

describe ApplicationController do
  describe "current_tab" do
    before do
      class TestController < ApplicationController; end
      @test_controller = TestController.new
    end

    it "should return the tab-name" do
      @test_controller.current_tab.should == :test
    end
  end
end