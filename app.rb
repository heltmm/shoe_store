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
