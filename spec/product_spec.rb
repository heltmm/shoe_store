require('spec_helper')

describe(Product) do
  it { should belong_to(:shoe)}
  it { should belong_to(:store)}
end
