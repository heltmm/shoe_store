require('spec_helper')

describe(Shoe) do
  it { should have_many(:products)}
  it { should have_many(:stores)}
end
