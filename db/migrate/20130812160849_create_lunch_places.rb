class CreateLunchPlaces < ActiveRecord::Migration
  def change
    create_table :lunch_places do |t|
      t.integer :lunch_id
      t.integer :place_id

      t.timestamps
    end
  end
end
