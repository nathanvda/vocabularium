require 'spec_helper'

TEST_NAME = 'test_name'
TEST_EMAIL = "bla@bla.com"
TEST_FULL_NAME = "Tester met volledige Naam"

describe User do
  describe "show_name" do
    it "returns name if that is set" do
      u = User.new(:name => TEST_NAME, :email => TEST_EMAIL, :fullname => TEST_FULL_NAME)
      u.show_name.should == TEST_NAME
    end
    it "returns full_name if that is set" do
      u = User.new(:email => TEST_EMAIL, :fullname => TEST_FULL_NAME)
      u.show_name.should == TEST_FULL_NAME
    end
    it "returns email if neither name or full_name are set" do
      u = User.new(:email => TEST_EMAIL)
      u.show_name.should == TEST_EMAIL
    end

  end
end
