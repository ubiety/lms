# Course controller
class CoursesController < ApplicationController
  def index
    @courses = policy_scope(Course)
    authorize @courses
  end

  def new
    @course = Course.new
    authorize @course
  end

  def create
    @course = Course.create(course_params)
    authorize @course
    if @course.save!
      redirect_to course_path(@course), flash: { success: 'Course created' }
    else
      render action: :new
    end
  end

  def show
    @course = Course.find(params[:id])
    authorize @course
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
end
