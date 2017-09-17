# Assignment Controller
class AssignmentsController < ApplicationController
  before_action :find_course, only: %w[new]

  def show; end

  def new
    @assignment = @course.assignments.new
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  private

  def find_course
    @course = Course.friendly.find(params[:course_id])
  end
end
