class UserLanguagesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_user_language, :only => [:show, :edit, :update, :destroy]


  def index
    @user_languages = UserLanguage.owned_by(current_user)
  end

  def show
  end

  def new
    @user_language = UserLanguage.new
  end

  def edit
  end

  def create
    @user_language = UserLanguage.new(params[:user_language])
    @user_language.user_id = current_user.id

    if @user_language.save
      redirect_to(@user_language, :notice => 'User language was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @user_language.update_attributes(params[:user_language])
      redirect_to(@user_language, :notice => 'User language was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @user_language.destroy

    redirect_to(user_languages_url)
  end

protected

  def find_user_language
    @user_language = UserLanguage.find(params[:id])
  end

end
