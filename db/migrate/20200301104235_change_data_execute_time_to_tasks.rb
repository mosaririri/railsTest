class ChangeDataExecuteTimeToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :execute_time, :integer
  end
end
