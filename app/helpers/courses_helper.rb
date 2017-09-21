module CoursesHelper
  def due_date_style(due_date)
    diff = due_date - Time.now

    if diff > 7.days
      'text-success'
    elsif diff < 7.days && diff > 2.days
      'text-warning'
    else
      'text-danger'
    end
  end
end
