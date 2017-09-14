# Enrolment controller
class EnrolmentsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @enrolment = @course.enrolments.new
    @students = User.joins(:courses).where.has { role == User.roles[:student] }
    authorize @enrolment
  end

  def create
    @course = Course.find(params[:course_id])
    @enrolment = @course.enrolments.create(enrolment_params)
    authorize @enrolment

    if @enrolment.save!
      redirect_to @course, flash: { success: 'Enrolled student' }
    else
      @students = User.where role: User.roles[:student]
      flash.now[:error] = 'Error enrolling student'
      render action: :new
    end
  end

  private

  def enrolment_params
    params.require(:enrolment).permit(:user_id)
  end
end
