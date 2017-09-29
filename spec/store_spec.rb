require('spec_helper')

describe(Store) do
  it { should have_many(:products)}

  it { should have_many(:shoes)}

  it("validates presence of name") do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end

  it("validates presence of location") do
    store = Store.new({:location => ''})
    expect(store.save()).to(eq(false))
  end

  it { should validate_length_of(:name).is_at_most(100) }

  it('capitalizes the first letter of every word in name') do
    store = Store.create({:name => "jim's discount shoe store", :location => "mars"})
    expect(store.name).to eq("Jim's Discount Shoe Store")
  end
end
