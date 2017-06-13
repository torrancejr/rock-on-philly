class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name, null:false
      t.string :location, null:false
      t.string :ages, null:false
      t.integer :capacity, null:false
      t.string :website
      t.string :photo

    end
  end
end
