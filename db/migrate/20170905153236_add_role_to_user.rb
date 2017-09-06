class AddRoleToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.integer :role
    end
  end
end
