class AddUserIdToFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :user_id, :integer
    add_column :favorites, :student_post_id, :integer
    add_column :favorites, :teacher_post_id, :integer
  end
end
