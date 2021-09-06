class CreateCommentTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_teachers do |t|

      t.text :comment
      t.integer :user_id
      t.integer :teacher_post_id

      t.timestamps
    end
  end
end
