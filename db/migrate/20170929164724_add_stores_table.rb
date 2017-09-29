class AddStoresTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:location, :string)
      t.column(:location_type, :string)
    end
  end
end
