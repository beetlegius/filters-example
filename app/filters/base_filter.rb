class BaseFilter
  include ActiveModel::Model

  attr_accessor :page, :sort_column, :sort_direction

  DEFAULT_SORT_DIRECTION = 'desc'.freeze
  DEFAULT_SORT_COLUMN    = 'id'.freeze

  def initialize(*args)
    super

    @sort_column    ||= default_sort_column
    @sort_direction ||= default_sort_direction
  end

  private
  
  def paginate(records)
    records.order(sorting_order).page(@page)
  end

  def sorting_order
    "#{sorting_columns[@sort_column]} #{@sort_direction}"
  end

  def sorting_columns
    HashWithIndifferentAccess.new(columns).freeze
  end

  def columns
    fail NotImplementedError
  end

  def default_sort_column
    DEFAULT_SORT_COLUMN
  end

  def default_sort_direction
    DEFAULT_SORT_DIRECTION
  end

end
