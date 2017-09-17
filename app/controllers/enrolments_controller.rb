# Enrolment controller
class EnrolmentsController < ApplicationController
  before_filter :find_course

  def new
    @enrolment = @course.enrolments.new
    @students = User.joining { enrolments.outer }.where.has do |u|
      (u.role == User.roles[:student]) & ((u.enrolments.course_id == nil) | (u.enrolments.course_id != @course.id))
    end
    authorize @enrolment
  end

  def create
    @enrolment = @course.enrolments.create(enrolment_params)
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
