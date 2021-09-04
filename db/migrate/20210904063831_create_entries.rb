class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      
      t.integer :user_id, foreign_key: true
      t.integer :room_id, foreign_key: true

      t.timestamps
    end
  end
end
