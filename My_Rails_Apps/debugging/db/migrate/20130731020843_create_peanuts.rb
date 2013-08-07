class CreatePeanuts < ActiveRecord::Migration
  def change
    create_table :peanuts do |t|
      t.string :flavor_value
      t.string :calories

      t.timestamps
    end
  end
end
