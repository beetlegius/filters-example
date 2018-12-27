class ApplicationDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def show_button(class_name: 'btn btn-sm btn-primary', anchor: nil)
    icon_class = 'fa-fw' if anchor

    h.link_to h.fa_icon(:eye, class: icon_class, text: anchor),
              object,
              class: class_name,
              title: h.t(:view),
              data: { disable_with: spinner(anchor) }
  end

  def edit_button(class_name: 'btn btn-sm btn-warning', anchor: nil)
    icon_class = 'fa-fw' if anchor

    h.link_to h.fa_icon(:pencil, class: icon_class, text: anchor),
              [:edit, object],
              class: class_name,
              title: h.t(:edition),
              data:  { disable_with: spinner(anchor) }
  end

  def delete_button(class_name: 'btn btn-sm btn-danger', anchor: nil)
    return nil unless object.destroyable?

    icon_class = 'fa-fw' if anchor

    h.link_to h.fa_icon(:trash, class: icon_class, text: anchor),
              object,
              method: :delete,
              class: class_name,
              title: h.t(:delete),
              data: {
                disable_with: spinner(anchor),
                confirm: h.t(:confirm)
              }
  end

  def return_button(path = nil)
    anchor = h.fa_icon(:reply, class: 'fa-fw', text: h.t(:return))
    path   = path.presence || object.class

    h.link_to anchor, path,
              class: 'btn bg-purple'
  end

  protected

  def spinner(anchor = nil)
    h.fa_icon(:refresh, class: 'fa-spin', text: anchor).html_safe
  end

end
