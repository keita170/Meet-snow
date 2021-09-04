class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      
      t.text :comment
      t.integer :user_id
      t.integer :student_post_id
      t.integer :teacher_post_id
      

      t.timestamps
    end
  end
end
