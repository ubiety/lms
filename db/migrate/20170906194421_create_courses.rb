# Course migration
class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.references :instructor, null: false

      t.timestamps
    end
  end
end
