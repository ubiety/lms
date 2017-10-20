# Enrolment controller
class EnrolmentsController < ApplicationController
  before_action :find_course

  def new
    @enrolment = @course.enrolments.new
    @students = User.unenrolled(@course)
    authorize @enrolment
  end

  def create
    @enrolment = @course.enrolments.new(enrolment_params)
    authorize @enrolment
    if @enrolment.save!
      redirect_to @course, flash: { success: 'Enrolled student' }
    else
      @students = User.where role: User.roles[:student]
      flash.now[:error] = 'Error enrolling student'
      render :new
    end
  end

  private

  def find_course
    @course = Course.friendly.find(params[:course_id])
  end

  def enrolment_params
    params.require(:enrolment).permit(:user_id)
  end
end
