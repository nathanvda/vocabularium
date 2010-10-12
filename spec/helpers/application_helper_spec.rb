require 'spec_helper'

describe ApplicationHelper do
  describe "float to s" do
    it "should render empty string for nil" do
      helper.float_to_s(nil).should == ''
    end
    it "should render a float to 2 digits" do
      helper.float_to_s(1.33333).should == '1.33'
    end
  end

  example "remove_child_link" do
    f = mock()
    f.should_receive(:hidden_field).with(:_destroy).and_return('bla')
    helper.remove_child_link('name', f).should == "bla<a href=\"javascript:void(0)\" class=\"remove_child\">name</a>"
  end

  example "add_child_link" do
    helper.add_child_link('name', 'relation').should == "<a href=\"javascript:void(0)\" class=\"add_child\" data-association=\"relation\">name</a>"
  end

  example "switch_visibility_link" do
    helper.switch_visibility_link('bla', 'hide', 'show', 'init-class', 'id_str').should == "<a href=\"#\" class=\"switch_link init-class\" data-hide=\"hide\" data-show=\"show\" id=\"id_str\">bla</a>"
  end



end