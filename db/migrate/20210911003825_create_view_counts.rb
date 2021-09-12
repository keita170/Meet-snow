class CreateViewCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :view_counts do |t|

      t.string :user_id
      t.string :student_post_id

      t.timestamps
    end
  end
end
