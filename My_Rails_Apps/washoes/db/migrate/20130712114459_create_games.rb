class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :bracket
      t.integer :winner_id

      t.timestamps
    end
  end
end
