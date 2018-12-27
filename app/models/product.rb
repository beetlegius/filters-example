class Product < ApplicationRecord
  
  include Destroyable
  
  belongs_to :category
  
  scope :with_name, ->(name) { where "name LIKE :q", q: "%#{name}%" }
  scope :from_category, ->(category_id) { where category_id: category_id }
end
