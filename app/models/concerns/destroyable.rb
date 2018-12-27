module Destroyable
  extend ActiveSupport::Concern

  def destroyable?
    true
  end

  def destroy
    super if destroyable?
  end
end
