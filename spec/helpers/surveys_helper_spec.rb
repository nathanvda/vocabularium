require 'spec_helper'

describe SurveysHelper do
  describe "show score" do
    it "should render text if score not defined" do
      helper.show_score(nil).should == I18n.t('survey.not_taken_yet')
    end
    it "should render float correctly" do
      helper.show_score(33.3333333).should == '33.33'
    end
  end
end