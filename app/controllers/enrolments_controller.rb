# Enrolment controller
class EnrolmentsController < ApplicationController
  before_action :find_course, :find_unenrolled_students

  def new
    @enrolment = @course.enrolments.new
    authorize @enrolment
  end

  def create
    user_ids = params[:enrolment][:user_id].reject!(&:empty?)

    @enrolment = user_ids.map { |user| @course.enrolments.create(enrolment_params(user)) }

    redirect_to @course
  end

  private

  def find_course
    @course = Course.friendly.find(params[:course_id])
  end

  def find_unenrolled_students
    @students = User.unenrolled(@course)
  end

  def enrolment_params(user)
    params.require(:enrolment).permit(:user_id).merge(user_id: user)
  end
end
