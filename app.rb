require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/brands") do
  @brands = Brand.all()
  erb(:brands)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

post("/brands") do
  name = params.fetch("brand_name")
  price = params.fetch("brand_price")
  Brand.create({:name => name, :price => price})
  redirect("/brands")
end

post("/stores") do
  name = params.fetch("store_name")
  Store.create({:name => name})
  redirect("/stores")
end

get("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  # if @brand.store_id
  #   @store = Store.find(@brand.store_id)
  # else
  #   @store = nil
  # end
  @stores = Store.all
  erb(:brand)
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all
  erb(:store)
end

patch("/brands/:id") do
  store_id = params.fetch("store_id").to_i()
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.stores.push(store_id)
  redirect back
end

patch("/stores/:id") do
  brand = Brand.find(params.fetch("brand_id").to_i())
  @store = Store.find(params.fetch("id").to_i())
  @store.brands.push(brand)
  redirect back
end
