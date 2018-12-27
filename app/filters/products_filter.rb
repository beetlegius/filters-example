class ProductsFilter < BaseFilter

  attr_accessor :name, :price_gte, :price_lte, :category_id

  def call
    records = default_records

    records = records.with_name(@name) if @name.present?
    records = records.where("price >= :price", price: @price_gte) if @price_gte.present?
    records = records.where("price <= :price", price: @price_lte) if @price_lte.present?
    records = records.from_category(@category_id) if @category_id.present?

    paginate(records)
  end

  private

  def default_records
    Product.includes(:category)
  end

  def columns
    {
      id:       'products.id',
      name:     'products.name',
      price:    'products.price',
      category: 'categories.name'
    }
  end
end
