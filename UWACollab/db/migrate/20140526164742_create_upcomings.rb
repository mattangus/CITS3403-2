class CreateUpcomings < ActiveRecord::Migration
  def change
    create_table :upcomings do |t|
      t.string :name
      t.string :date
      t.string :tag
      t.integer :external_id
      t.string :id_type

      t.timestamps
    end
  end
end
