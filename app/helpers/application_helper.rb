module ApplicationHelper
  def active_page_menu?(page)
    return 'active' if controller_name == page
  end
end
