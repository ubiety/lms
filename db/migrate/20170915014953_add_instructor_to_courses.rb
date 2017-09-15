class AddInstructorToCourses < ActiveRecord::Migration[5.1]
  def change
    change_table :courses do |t|
      t.references :instructor
    end
  end
end
