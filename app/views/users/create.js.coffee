$("<%= escape_javascript(render 'users/user_row', user: @user) %>")
  .appendTo('#user-table tbody')
$('#user-new-modal').modal('hide')
