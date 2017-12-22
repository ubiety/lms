# Assignment model
class Assignment < ApplicationRecord
  extend Dragonfly::Model

  belongs_to :course

  dragonfly_accessor :document

  def overdue
    due_date < Date.today
  end
end
