class CreateFiles < ActiveRecord::Migration
  def change
    create_table :files do |t|
      t.string :name
      t.string :location
      t.string :original_name
      t.integer :access
      t.integer :access_type

      t.timestamps
    end
  end
end
