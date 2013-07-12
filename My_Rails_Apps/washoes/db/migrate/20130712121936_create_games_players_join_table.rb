class CreateGamesPlayersJoinTable < ActiveRecord::Migration
  def change
      create_table :games_players do |t|
        t.references :game
        t.references :player
        t.references :winner
      end
  end
end
