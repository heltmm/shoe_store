require('spec_helper')

describe(Store) do
  it { should have_many(:products)}
  it { should have_many(:shoes)}
end
