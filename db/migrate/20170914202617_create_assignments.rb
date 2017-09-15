class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :video_uid
      t.string :document_uid

      t.timestamps
    end
  end
end
