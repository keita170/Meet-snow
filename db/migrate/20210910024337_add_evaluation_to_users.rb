class AddEvaluationToUsers < ActiveRecord::Migration[5.2]
  def change
    
    add_column :users, :evaluation, :float
    add_column :users, :recommend, :integer
    add_column :users, :content, :text
    
  end
end
