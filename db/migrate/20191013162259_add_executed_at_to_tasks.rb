class AddExecutedAtToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :executed_at, :datetime
  end
end
