class PacketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_packet, :only => [:show, :edit, :update, :destroy]
  before_filter :find_languages, :only => [:new, :edit]

  def index
    @packets = Packet.owned_by(current_user)
  end

  def show
  end

  def new
    @packet = Packet.new
    @packet.words.build
  end

  def edit
  end

  def create
    @packet = Packet.new(params[:packet])
    @packet.user_id = current_user.id

    if @packet.save
      redirect_to(@packet, :notice => t('packet.is_made'))
    else
      render :action => "new"
    end
  end

  def update
    if @packet.update_attributes(params[:packet])
      redirect_to(@packet, :notice => t('packet.is_updated'))
    else
      render :action => "edit"
    end
  end

  def destroy
    if @packet.surveys.size == 0
      @packet.destroy
      flash[:notice] = t('packet.is_deleted')
    else
      flash[:warning] = t('packet.cannot_be_deleted', :name => @packet.name)
    end
    redirect_to packets_url
  end

  def add_language
    Packet.transaction do
      new_language = UserLanguage.create(:name => params[:language_name],
                                         :abbr => params[:language_abbr],
                                         :user_id => current_user.id)
      if new_language.valid?
        packet_id = params[:id]
        if packet_id.starts_with?('new')
          @packet = Packet.new
        else
          @packet = Packet.find(packet_id.sub('edit_packet_', ''))
        end
        find_languages
        render :partial => 'languages', :layout => false
      else
        build_error =
        render :text => build_error_message(new_language), :status => 422
      end
    end
  end


  private


  def find_packet
    @packet = Packet.owned_by(current_user).find(params[:id])
  end

  def find_languages
    @languages = UserLanguage.owned_by(current_user)
  end

  def build_error_message(object_with_error)
    result = I18n.with_options :scope => [:errors, :template] do |locale|
      object_model_name = object_with_error.class.model_name.human.downcase.to_s.gsub('_', ' ')
      count = object_with_error.errors.count
      header_message = locale.t :header, :count => count, :model => object_model_name
      message = locale.t(:body)
      error_messages = object_with_error.errors.full_messages.join("\n")

      [header_message, message,error_messages].join("\n")
    end
  end

end
