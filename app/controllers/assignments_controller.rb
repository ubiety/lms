class AssignmentsController < ApplicationController
  def show; end

  def new
    @course = Course.friendly.find(params[:course_id])
    @assignment = @course.assignments.new
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
