module NavigationHelper
  def navigation_tab(tab)
    klass = (controller.current_tab == tab) ?  'current' : nil
    label = tab_label(tab)
    href  = send("#{tab}_path")

    content_tag(:li, :class => ['tab', klass].compact.join(' ')) do
      link_to label, href
    end
  end

  def tab_label(tab)
    t("tabs.#{tab}")
  end
end