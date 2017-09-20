class AddIndicies < ActiveRecord::Migration[5.1]
  def change
    change_table :merit_actions do |t|
      t.index :user_id
    end

    change_table :merit_activity_logs do |t|
      t.index :related_change_id
      t.index :related_change_type
    end

    change_table :users do |t|
      t.index :sash_id
    end
  end
end
