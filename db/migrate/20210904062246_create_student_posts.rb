class CreateStudentPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :student_posts do |t|
      
      t.string :title, null: false
      t.text :body, null: false
      t.integer :field, null: false

      t.timestamps
    end
  end
end
