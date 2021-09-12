class CreateTeacherViewCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_view_counts do |t|

      t.string :user_id
      t.string :teacher_post_id

      t.timestamps
    end
  end
end
