class AddPriceToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column(:brands, :price, :decimal, :precision => 8, :scale => 2)
  end
end
