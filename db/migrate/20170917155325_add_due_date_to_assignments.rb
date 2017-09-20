class AddDueDateToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :due_date, :datetime
  end
end
