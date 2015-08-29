class ChangeAddressTypeInArts < ActiveRecord::Migration
  def up
    change_column :arts, :address, :string
    add_column :arts, :type, :string
  end

  def down
    change_column :arts, :address, :float
    remove_column :arts, :type
  end
end
