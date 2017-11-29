# Enrolment model
class Enrolment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  attr_accessor :student_ids
end
