# Enrolment controller
class EnrolmentsController < ApplicationController
  before_action :find_course, :find_unenrolled_students

  def new
    @enrolment = @course.enrolments.new
    authorize @enrolment
  end

  def create
    @enrolment = enrolment_params[:student_ids].map { |e| @course.enrolments.create!(user_id: e)  }
    redirect_to @course
  end

  private

  def find_course
    @course = Course.friendly.find(params[:course_id])
  end

  def find_unenrolled_students
    @students = User.unenrolled(@course)
  end

  def enrolment_params
    params.require(:enrolment).permit(student_ids: [])
  end
end
