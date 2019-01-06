class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.string :status
      t.string :Location
      t.string :specification
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
