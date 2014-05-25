class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.string :format
      t.integer :sender_id
      t.integer :group_id

      t.timestamps
    end
  end
end
