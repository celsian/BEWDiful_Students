class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.text :score
      t.belongs_to :player
      t.belongs_to :game
      
      t.timestamps
    end
  end
end
