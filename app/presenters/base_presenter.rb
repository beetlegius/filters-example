class BasePresenter

  def initialize(params)
    @params = params
  end
  
  private

  def filter_params
    parameters = @params.permit(*default_params)
    
    @params
      .fetch(filter_key, {})
      .permit(*custom_params)
      .merge(parameters)
  end
  
  def default_params
    %w(page sort_column sort_direction)
  end

end
