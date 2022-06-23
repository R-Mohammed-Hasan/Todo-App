class CreateTodoTable < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_tables do |t|
      t.integer :id
      t.text :todo_text
      t.date :due_date
      t.boolean :completed

      t.timestamps
    end
  end
end
