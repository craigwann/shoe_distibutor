post("/stores/:id/brand") do
  store_id = params.fetch("store_id").to_i()
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.stores.push(store_id)
  redirect back
end
