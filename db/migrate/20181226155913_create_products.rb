class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 15, scale: 2
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
