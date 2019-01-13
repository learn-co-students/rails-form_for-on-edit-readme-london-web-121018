class AddColumnToNeopets < ActiveRecord::Migration
  def change
    add_column :neopets, :user_id, :integer
  end
end
