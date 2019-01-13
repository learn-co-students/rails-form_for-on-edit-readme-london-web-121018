class CreateNeopets < ActiveRecord::Migration
  def change
    create_table :neopets do |t|
      t.string :name
      t.boolean :vegan, :default => false 

      t.timestamps null: false
    end
  end
end
