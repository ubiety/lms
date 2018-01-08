# Course helper methods
module CoursesHelper
  def due_date_style(assignment)
    if assignment.overdue?
      'text-danger'
    elsif assignment.due_between(7.days, 2.days)
      'text-warning'
    else
      'text-success'
    end
  end
end
