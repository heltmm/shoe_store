class Shoe <ActiveRecord::Base
  has_many :products
  has_many :stores, through: :products
  validates(:brand, {:presence => true, :length => {:maximum => 100}})
  validates(:price, :presence => true)
  validates(:brand, uniqueness: true)
  before_save(:capitalize_brand)

private
  def capitalize_brand
    self.brand = (brand.split(" ").map {|word| word.capitalize}).join(' ')
  end
end
