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
    @saved = true
  else
    @not_saved = true
  end
  @stores = Store.all
  @shoes = Shoe.all
  erb(:index)
end

post('/create/shoe') do

end
