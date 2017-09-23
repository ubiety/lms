class AddPeriodToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :start_time, :time
    add_column :courses, :end_time, :time
  end
end
