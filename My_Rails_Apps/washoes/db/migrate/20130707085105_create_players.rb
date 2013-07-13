class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :active #1 for adding to current bracket, 0 for skipping.
      t.belongs_to :game

      t.timestamps
    end
  end
end
