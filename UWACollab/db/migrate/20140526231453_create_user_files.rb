class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.string :name
      t.string :attachment
      t.integer :user_id

      t.timestamps
    end
  end
end
