require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'a database of stores and shoes', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    fill_in('name', :with => "Jim's shoe store")
    fill_in('location', :with => 'Portland')
    click_button('Add Store')
    expect(page).to have_content("Jim's Shoe Store at Portland was successfully saved.")
  end
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    fill_in('brand', :with => "Addidas")
    fill_in('price', :with => '7')
    click_button('Add Shoe')
    expect(page).to have_content("Addidas at $7.00 was successfully saved.")
  end

    it('shoes available at idiviual stores' ) do
    shoe = Shoe.create({:brand => 'nike', :price => '7'})
    store = Store.create({:name => 'Shoe Store', :location => 'Portland', :shoe_ids => shoe.id})

    visit '/stores'
    click_on('Shoe Store')
    expect(page).to have_content('Nike')
  end
end
