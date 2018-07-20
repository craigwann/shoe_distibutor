class AddPriceToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column(:brands, :price, :decimal)
  end
end
