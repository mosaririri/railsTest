class AddExecuteTimeToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :execute_time, :string
  end
end
