# Assignment Controller
class AssignmentsController < ApplicationController
  before_action :find_course, only: %w[new create show edit update]
  before_action :find_assignment, only: %w[show edit update]

  def show
    authorize @assignment
  end

  def new
    @assignment = @course.assignments.new
    authorize @assignment
  end

  def create
    authorize @assignment
    @assignment = @course.assignments.create(assignment_params)
    if @assignment.save!
      redirect_to [@course, @assignment],
                  flash: { success: 'Assignment created' }
    else
      render :new
    end
  end

  def edit
    authorize @assignment
  end

  def update
    authorize @assignment
    @assignment.assign_attributes(assignment_params)
    if @assignment.save!
      redirect_to [@course, @assignment],
                  flash: { success: 'Assignment updated' }
    else
      render :edit
    end
  end

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
