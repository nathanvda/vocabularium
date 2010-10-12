require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PacketsHelper. For example:
#
# describe PacketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe NavigationHelper do
  describe "tab_label" do
    it "should get the correct translation" do
      helper.tab_label('root').should == I18n.t('tabs.root')
    end
  end

  describe "navigation_tab" do
    it "should render tabs that are not current" do
      controller.stub!(:current_tab).and_return('not_root')
      helper.navigation_tab('root').should == "<li class=\"tab\"><a href=\"/\">#{I18n.t('tabs.root')}</a></li>"
    end

    it "should give tab a different class id the tab is current" do
      controller.stub!(:current_tab).and_return('root')
      helper.navigation_tab('root').should ==  "<li class=\"tab current\"><a href=\"/\">#{I18n.t('tabs.root')}</a></li>"
    end

  end
end