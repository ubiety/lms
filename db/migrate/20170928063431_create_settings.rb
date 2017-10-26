# Create settings table migration
class CreateSettings < ActiveRecord::Migration[5.1]
  def self.up
    create_table :settings do |table|
      table.string  :var,        null: false
      table.text    :value,      null: true
      table.integer :thing_id,   null: true
      table.string  :thing_type, null: true, limit: 30
      table.timestamps
    end

    add_index :settings, %i(thing_type thing_id var), unique: true
  end

  def self.down
    drop_table :settings
  end
end
