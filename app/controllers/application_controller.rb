class ApplicationController < ActionController::Base
  protect_from_forgery

  public

    def current_tab
      self.controller_name.to_sym
    end

end
