# Enrolment controller
class EnrolmentsController < ApplicationController
  before_action :find_course, :find_unenrolled_students

  def new
    @enrolment = @course.enrolments.new
    authorize @enrolment
  end

  def create
    @enrolment = @course.enrolments.new(enrolment_params)
    authorize @enrolment
    if @enrolment.save
      redirect_to @course, flash: { success: _('Enrolled student') }
    else
      flash.now[:error] = _('Error enrolling student')
      render :new
    end
  end

  private

  def find_course
    @course = Course.friendly.find(params[:course_id])
  end

  def find_unenrolled_students
    @students = User.unenrolled(@course)
  end

  def enrolment_params
    params.require(:enrolment).permit(user_id: [])
  end
end
