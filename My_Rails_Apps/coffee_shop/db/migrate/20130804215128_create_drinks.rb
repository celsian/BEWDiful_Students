class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.decimal :price, scale: 2, precision: 5
      t.text :description

      t.timestamps
    end
  end
end
