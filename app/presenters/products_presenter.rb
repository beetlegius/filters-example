class ProductsPresenter < BasePresenter

  FIELDS = [:id, :name, :price, :category].freeze

  def products
    @products ||= filter.call.decorate
  end
  
  def filter
    @filter ||= ProductsFilter.new(filter_params)
  end

  private
  
  def filter_key
    :products_filter
  end
  
  def custom_params
    %w(name price_gte price_lte category_id)
  end


end
