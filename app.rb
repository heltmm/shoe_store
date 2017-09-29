require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all
  @shoes = Shoe.all
  erb(:index)
end

post('/create/store') do
  @store = Store.create({:name => params['name'], :location => params['location']})
  if @store.id
    @store_saved = true
  else
    @store_not_saved = true
  end
  @stores = Store.all
  @shoes = Shoe.all
  erb(:index)
end

post('/create/shoe') do
  @shoe = Shoe.create({:brand => params['brand'], :price => params['price']})
  if @shoe.id
    @shoe_saved = true
  else
    @shoe_not_saved = true
  end
  @stores = Store.all
  @shoes = Shoe.all
  erb(:index)
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end

get('/store/:id') do
  @store = Store.find(params['id'])
  erb(:store)
end

get('/shoes') do
  @shoes = Shoe.all
  erb(:shoes)
end

get('/shoe/:id') do
  @shoe = Shoe.find(params['id'])
  erb(:shoe)
end

delete('/store/delete/:id') do
  @deleted_store = Store.find(params['id'])
  @store_delete = true
  Store.delete(params['id'])
  @stores = Store.all
  erb(:stores)
end

delete('/shoe/delete/:id') do
  @deleted_shoe = Shoe.find(params['id'])
  @shoe_delete = true
  Shoe.delete(params['id'])
  @shoes = Shoe.all
  erb(:shoes)
end

get('/shoe/update/:id') do
  @shoe = Shoe.find(params['id'])

  erb(:update_shoe)
end

get('/store/update/:id') do
  @store = Store.find(params['id'])
  @shoes = Shoe.all
  @current_shoes = @store.shoes
  erb(:update_store)
end

patch('/store/update/name/:id') do
  @old_name = Store.find(params['id']).name
  if Store.find(params['id']).update({:name => params['name']})
    @name_updated = true
  else
    @name_not_updated = true
  end
  @store = Store.find(params['id'])
  erb(:store)
end

patch('/store/update/location/:id') do
  @old_location = Store.find(params['id']).location
  if x = Store.find(params['id']).update({:location => params['location']})
    @location_updated = true
  else
    @location_not_updated = true
  end
  @store = Store.find(params['id'])
  erb(:store)
end

patch('/store/update/shoes/:id') do
  Store.find(params['id']).update({:shoe_ids => params['shoe_ids']})
  @shoes_updated = true
  @store = Store.find(params['id'])
  erb(:store)
end

patch('/shoe/update/brand/:id') do
  @old_brand = Shoe.find(params['id']).brand
  if Shoe.find(params['id']).update({:brand => params['brand']})
    @brand_updated = true
  else
    @brand_not_updated = true
  end
  @shoe = Shoe.find(params['id'])
  erb(:shoe)
end

patch('/shoe/update/price/:id') do
  @old_price = Shoe.find(params['id']).price
  if Shoe.find(params['id']).update({:price => params['price']})
    @price_updated = true
  else
    @price_not_updated = true
  end
  @shoe = Shoe.find(params['id'])
  erb(:shoe)
end

post('/shoe/remove/:id') do
  Store.find(params['store_id']).shoes.delete(params['id'])
  redirect("/store/#{params['store_id']}")
end
