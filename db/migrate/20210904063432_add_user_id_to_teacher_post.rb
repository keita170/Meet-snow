class AddUserIdToTeacherPost < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_posts, :user_id, :integer
  end
end
