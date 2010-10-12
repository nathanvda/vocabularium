require 'spec_helper'

describe HomeHelper do
  describe "home_link_to_new_test" do
    before (:each) do
      @user = Factory(:user)
    end

    it "should show no link if the user has no packets" do
      helper.home_link_to_new_test(@user).should ==
              "<td class=\"disabled\">#{I18n.t('home.index.add_survey')}</td>"
    end

    it "should show the link if the uses has packets" do
      @user.stub(:packets).and_return([1,24,4])
      helper.home_link_to_new_test(@user).should ==
           "<td><a href=\"/surveys/new\">#{I18n.t('home.index.add_survey')}</a></td>"

    end
  end

  describe "home_link_to_do_test" do
    before (:each) do
      @user = Factory(:user)
    end

    it "should show no link if the user has no surveys" do
      helper.home_link_to_do_test(@user).should ==
              "<td class=\"disabled\">#{I18n.t('home.index.do_test')}</td>"
    end

    it "should show the link if the uses has packets" do
      @user.stub(:surveys).and_return([1,24,4])
      helper.home_link_to_do_test(@user).should ==
           "<td><a href=\"/surveys\">#{I18n.t('home.index.do_test')}</a></td>"

    end
  end
end
