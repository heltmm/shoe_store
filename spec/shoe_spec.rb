require('spec_helper')

describe(Shoe) do
  it { should have_many(:products)}

  it { should have_many(:stores)}

  it("validates presence of brand") do
    shoe = Shoe.new({:brand => ''})
    expect(shoe.save()).to(eq(false))
  end

  it("validates presence of price") do
    shoe = Shoe.new({:price => ''})
    expect(shoe.save()).to(eq(false))
  end

  it { should validate_length_of(:brand).is_at_most(100) }

  it('capitalizes the first letter of every word in brand') do
    shoe = Shoe.create({:brand => "air jordans", :price => "44"})
    expect(shoe.brand).to eq("Air Jordans")
  end
end
