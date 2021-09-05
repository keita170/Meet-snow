class CreateFavoriteTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_teachers do |t|

      t.integer :user_id
      t.integer :teacher_post_id

      t.timestamps
    end
  end
end
