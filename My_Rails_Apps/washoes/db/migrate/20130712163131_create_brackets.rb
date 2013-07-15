class CreateBrackets < ActiveRecord::Migration
  def change
    create_table :brackets do |t|
      t.string :name
      t.integer :total_players

      t.timestamps
    end
  end
end
