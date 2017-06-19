class RemoveCapacityFromVenues < ActiveRecord::Migration[5.1]
  def up
    remove_column :venues, :capacity
  end
  def down
    add_column :venues, :capacity, :integer
  end
end
