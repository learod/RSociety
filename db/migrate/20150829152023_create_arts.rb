class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title
      t.text :description
      t.float :latitude
      t.float :longitude
      t.float :address

      t.timestamps null: false
    end
  end
end
