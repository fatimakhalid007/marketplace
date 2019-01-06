class ChangeStringColumnFloat < ActiveRecord::Migration[5.0]
  def change
  	change_column :items, :price, :float, using: 'price::float'
  end
end
