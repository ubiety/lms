$("#user-<%= @user.id %>").replaceWith("<%= escape_javascript(render 'users/user_row', u: @user) %>")
$("#user-<%= @user.id %>-modal").modal('hide')
