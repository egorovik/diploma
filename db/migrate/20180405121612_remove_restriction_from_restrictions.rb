class RemoveRestrictionFromRestrictions < ActiveRecord::Migration
  def change
    remove_column :restrictions, :restriction, :string
  end
end
