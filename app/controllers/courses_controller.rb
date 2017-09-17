# Course controller
class CoursesController < ApplicationController
  before_filter :find_course, except: %w[index new create]
  before_filter :find_instructors, only: %w[new edit]

  def index
    @courses = policy_scope(Course)
    authorize @courses
  end

  def new
    @course = Course.new
    authorize @course
  end

  def edit
    authorize @course
  end

  def update
    authorize @course
    @course.update_attributes(course_params)
    if @course.save!
      redirect_to course_path(@course), flash: { success: 'Course updated' }
    else
      render :edit
    end
  end

  def create
    @course = Course.create(course_params)
    authorize @course
    if @course.save!
      redirect_to course_path(@course), flash: { success: 'Course created' }
    else
      render :new
    end
  end

  def show
    authorize @course
  end

  def destroy; end

  private

  def find_course
    @course = Course.friendly.find(params[:id])
  end

  def find_instructors
    @instructors = User.where.has { |u| u.role = User.roles[:instructor] }
  end

  def course_params
    params.require(:course).permit(:name, :instructor_id)
  end
end
