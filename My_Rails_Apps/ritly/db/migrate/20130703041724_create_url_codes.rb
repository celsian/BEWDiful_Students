class CreateUrlCodes < ActiveRecord::Migration
  def change
    create_table :url_codes do |t|
      t.text :url
      t.integer :code

      t.timestamps
    end
  end
end
