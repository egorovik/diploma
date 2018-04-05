class AddColumnsToRestriction < ActiveRecord::Migration
  def change
    add_column :restrictions, :same_room, :boolean
    add_column :restrictions, :same_floor, :boolean
    add_column :restrictions, :same_hostel, :boolean
    add_column :restrictions, :same_group, :boolean
    add_column :restrictions, :higher_floor, :boolean
    add_column :restrictions, :lower_floor, :boolean
  end
end
