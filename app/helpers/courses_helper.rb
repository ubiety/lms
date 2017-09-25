# Course helper methods
module CoursesHelper
  def due_date_style(due_date)
    diff = due_date - Time.now
    week = 7.days

    if diff > week
      'text-success'
    elsif diff < week && diff > 2.days
      'text-warning'
    else
      'text-danger'
    end
  end
end
