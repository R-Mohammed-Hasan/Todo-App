class ChangeDefaultValueOfCompletedField < ActiveRecord::Migration[6.1]

  def change

    change_column :todos, :completed, :bool, default: false

  end

end

