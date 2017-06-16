class RemoveAgeFromVenues < ActiveRecord::Migration[5.1]
  def up
    remove_column :venues, :ages
  end
  def down
    add_column :venues, :ages, :string
  end
end
