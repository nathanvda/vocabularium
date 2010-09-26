class HomeController < ApplicationController
  #before_filter :authenticate_user!

  def index
  end

  def about
  end

  def manual
  end

  def current_tab
    :root
  end

end
