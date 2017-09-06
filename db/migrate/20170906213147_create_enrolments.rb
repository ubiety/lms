# Enrolment migration
class CreateEnrolments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrolments do |t|
      t.references :course
      t.references :user
      t.boolean :instructor

      t.timestamps
    end
  end
end
