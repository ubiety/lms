# Assignment Controller
class AssignmentsController < ApplicationController
  before_action :find_course, only: %w[new create show]
  before_action :find_assignment, only: %w[show]

  def show; end

  def new
    @assignment = @course.assignments.new
  end

  def create
    @assignment = @course.assignments.create(assignment_params)
    if @assignment.save!
      redirect_to [@course, @assignment], flash: { success: 'Assignment created' }
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def find_course
    @course = Course.friendly.find(params[:course_id])
  end

  def find_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:name, :description, :due_date)
  end
end
