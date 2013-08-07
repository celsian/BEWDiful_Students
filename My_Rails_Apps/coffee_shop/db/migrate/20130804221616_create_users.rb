class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.decimal :balance, scale: 2, precision: 7

      t.timestamps
    end
  end
end
