module PageHelper

  ALL_BASE_CSS     = %w(reset-min fonts-min jquery-ui-1.8.6.custom application_layout application)

  def all_base_css
    ALL_BASE_CSS
  end

  def app_version
    "v#{::APP_VERSION}"
  end
end