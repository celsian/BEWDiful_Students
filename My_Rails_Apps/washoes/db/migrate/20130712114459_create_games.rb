class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :winner
      
      t.timestamps
    end
  end
end
