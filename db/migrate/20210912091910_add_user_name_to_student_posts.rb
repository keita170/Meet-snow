class AddUserNameToStudentPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :student_posts, :user_name, :string
  end
end
