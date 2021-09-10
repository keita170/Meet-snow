class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|

      t.integer :user_id
      t.string :user_select
      t.float :evaluation
      t.text :comment
      t.integer :content

      t.timestamps
    end
  end
end
