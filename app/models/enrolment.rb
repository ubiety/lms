# Enrolment model
class Enrolment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def self.enrolment(course, student)
    where('course_id = ? and user_id = ?', course.id, student.id).uniq
  end
end
