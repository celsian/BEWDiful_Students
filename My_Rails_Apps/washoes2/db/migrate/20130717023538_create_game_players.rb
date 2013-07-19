class CreateGamePlayers < ActiveRecord::Migration
  def change
    create_table :game_players do |t|
      t.references :player
      t.references :game

      t.timestamps
    end
  end
end
