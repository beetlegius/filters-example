module SelectHelper
  
  def categories_options
    @categories ||= Category.order(:name)
  end
  
end