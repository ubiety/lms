# Course controller
class CoursesController < ApplicationController
  def index
    @courses = policy_scope(Course)
    authorize @courses
  end

  def new
    @course = Course.new
    @instructors = User.where.has { |u| u.role = User.roles[:instructor] }
    authorize @course
  end

  def edit
    @course = Course.find(params[:id])
    @instructors = User.where.has { |u| u.role = User.roles[:instructor] }
    authorize @course
  end

  def update
    @course = Course.find(params[:id])
    authorize @course
    @course.update_attributes(course_params)
    if @course.save!
      redirect_to course_path(@course), flash: { success: 'Course updated' }
    else
      render action: :edit
    end
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
    params.require(:course).permit(:name, :instructor_id)
  end
end
