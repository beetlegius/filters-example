class Category < ApplicationRecord
  
  include Destroyable
  
  has_many :products
end
