class AddCourseToAssignments < ActiveRecord::Migration[5.1]
  def change
    change_table :assignments do |t|
      t.references :course
    end
  end
end
