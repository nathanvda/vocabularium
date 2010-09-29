require 'spec_helper'

describe Packet do
  context "test factory" do
    before (:each) do
      @user = Factory(:user)
      @packet = Factory(:packet, :user_id => @user.id)
    end

    it "should have no words" do
      @packet.words.size.should == 0
    end
  end


  context "test factory" do
    before (:each) do
      @user = Factory(:user)
      @packet = Factory(:packet_with_two_words, :user_id => @user.id)
    end

    it "should have two words" do
      @packet.words.size.should == 2
    end
  end
end
