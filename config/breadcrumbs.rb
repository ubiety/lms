crumb :root do
  link _('Dashboard'), root_path
end

crumb :users do
  link _('Users'), users_path
  parent :root
end

crumb :new_user do
  link _('New User'), new_user_path
  parent :users
end

crumb :user do |u|
  link u.full_name, u
  parent :users
end

crumb :courses do
  link _('Courses'), courses_path
  parent :root
end

crumb :course do |c|
  link c.name, c
  parent :courses
end

crumb :assignment do |a|
  link a.name, course_assignment_path(a.course, a)
  parent :course, a.course
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
