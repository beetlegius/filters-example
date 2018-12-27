class ProductDecorator < ApplicationDecorator
  
  def category_label
    h.link_to h.fa_icon(:archive, text: category.name, class: 'fa-fw'), category
  end
  
end
