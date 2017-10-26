class AddIndexForInstructorAndTime < ActiveRecord::Migration[5.1]
  def change
    add_index :courses, %w(instructor_id start_time), unique: true
  end
end
