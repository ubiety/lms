$("#user-<%= @user.id %>-modal").modal('hide')
$("#user-<%= @user.id %>")
  .replaceWith("<%= escape_javascript(render 'users/user_row', user: @user) %>")
