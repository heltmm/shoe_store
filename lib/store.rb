class Store < ActiveRecord::Base
  has_many :products
  has_many :shoes, through: :products
  validates(:name, {:presence => true, :length => {:maximum => 100}})
  validates(:location, :presence => true)
  validates(:name, uniqueness: {case_sensitive: false})
  before_save(:capitalize_input)

private
  def capitalize_input
    self.name = (name.split(" ").map {|word| word.capitalize}).join(' ')
    self.location = (location.split(" ").map {|word| word.capitalize}).join(' ')
  end
end
