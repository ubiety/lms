# Assignment model
class Assignment < ApplicationRecord
  extend Dragonfly::Model

  belongs_to :course

  dragonfly_accessor :document

  def overdue?
    due_date < Time.now
  end

  def due_between(start_time, end_time)
    diff = due_date - Time.now
    diff.between?(start_time, end_time)
  end
end
