class AddRememberMeToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.boolean :remember_me
    end
  end
end
