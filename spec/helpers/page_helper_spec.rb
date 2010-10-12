require 'spec_helper'

describe PageHelper do
  example "all_base_css" do
    helper.all_base_css.should == ["reset-min", "fonts-min", "application_layout", "application"]
  end

  example "app_version" do
    APP_VERSION='1.0'
    helper.app_version.should == "v1.0"
  end

end