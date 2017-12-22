# Enrolment model
class Enrolment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  attr_accessor :student_ids

  def self.enrolment(course, student)
    where('course_id = ? and user_id = ?', course.id, student.id).uniq
  end
end
