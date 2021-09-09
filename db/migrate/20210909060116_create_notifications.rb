class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|

      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :student_post_id
      t.integer :teacher_post_id
      t.integer :comment_id
      t.integer :comment_teacher_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.string :room_id
      t.string :message_id


      t.timestamps
    end

    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :student_post_id
    add_index :notifications, :teacher_post_id
    add_index :notifications, :comment_id
    add_index :notifications, :comment_teacher_id
  end
end
