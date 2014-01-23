class AddAnchorFieldToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :anchor, :integer, :default => 0
  end
end
