class AddProductsTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:products) do |t|
      t.column(:store_id, :integer)
      t.column(:shoe_id, :integer)
      t.column(:location_price, :money)
    end
  end
end
