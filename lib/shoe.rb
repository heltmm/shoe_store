class Store <ActiveRecord::Base
  has_many :products
  has_many :shoes, through: :foods
  validates(:brand, :presence => true)
  validates(:price, :presence => true)
  validates(:brand, uniqueness: true)
  before_save(:capitalize_brand)

private
  def capitalize_brand
    self.brand = (brand.split(" ").map {|word| word.capitalize}).join(' ')
  end
end
