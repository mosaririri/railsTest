class AddIsExecutedToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :is_executed, :bool
  end
end
