class Assignment < ApplicationRecord
  extend Dragonfly::Model

  dragonfly_accessor :document
end
