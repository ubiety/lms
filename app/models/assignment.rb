class Assignment < ApplicationRecord
  extend Dragonfly::Model

  belongs_to :course

  dragonfly_accessor :document
end
