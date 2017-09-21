class AddDescriptionToAssignments < ActiveRecord::Migration[5.1]
  def change
    change_table :assignments do |t|
      t.text :description
    end
  end
end
