module ApplicationHelper
  
  def nav_link(klass, icon: nil, path: nil)
    anchor      = icon ? fa_icon(icon, text: klass.model_name.human, class: 'fa-fw') : klass.model_name.human
    destination = path.presence || klass
    
    link_to anchor, destination,
      class: 'p-2 text-dark'
  end
  
end
