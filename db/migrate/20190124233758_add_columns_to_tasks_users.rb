class AddColumnsToTasksUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks_users, :completed_at, :datetime
  end
end
