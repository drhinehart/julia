class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.datetime :lunch_date
      t.datetime :vote_open
      t.datetime :vote_close

      t.timestamps
    end
  end
end
