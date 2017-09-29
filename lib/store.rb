class Store < ActiveRecord::Base
  has_many :products
  has_many :shoes, through: :products
  validates(:name, :presence => true)
  validates(:name, :presence => true)
  validates(:name, :presence => true)
  validates(:name, uniqueness: {case_sensitive: false})
  validates(:location, uniqueness: {case_sensitive: false})
  before_save(:capitalize_name)

private
  def capitalize_name
    self.name = (name.split(" ").map {|word| word.capitalize}).join(' ')
  end
end
