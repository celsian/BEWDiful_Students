class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.text :score
      t.belongs_to :player
      
      t.timestamps
    end
  end
end
