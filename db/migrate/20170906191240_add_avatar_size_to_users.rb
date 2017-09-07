class AddAvatarSizeToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.integer :avatar_size
    end
  end
end
