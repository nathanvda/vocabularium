module HomeHelper
  def home_link_to_new_test(user)
    logger.debug "received user = #{user.inspect}"
    has_packets = user.packets.size > 0  unless user.nil?
    has_packets ||= false
    content_tag('td', !has_packets ? {:class => 'disabled'} : {}) do
      has_packets ?
        link_to(t('home.index.add_survey'), new_survey_path) :
        t('home.index.add_survey')
    end
  end

  def home_link_to_do_test(user)
    has_surveys = user.surveys.size > 0  unless user.nil?
    has_surveys ||= false
    content_tag('td', !has_surveys ? {:class => 'disabled'} : {}) do
      has_surveys ?
        link_to(t('home.index.do_test'), surveys_path) :
        t('home.index.do_test')
    end
  end

end
