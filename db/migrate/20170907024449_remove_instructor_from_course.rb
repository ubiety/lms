# Remove column from course
class RemoveInstructorFromCourse < ActiveRecord::Migration[5.1]
  def change
    change_table :courses do |t|
      t.remove :instructor_id
    end
  end
end
