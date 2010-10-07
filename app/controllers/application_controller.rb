class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  public

    def current_tab
      self.controller_name.to_sym
    end

    def set_locale
      # also set locale based on param or path or http-accepts????

      # TODO timezone from user settings or something else ?
      Time.zone='Europe/Brussels'
    end

end
