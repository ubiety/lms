$("<%= escape_javascript(render 'users/user_row', u: @user) %>").appendTo('#user-table tbody')
$('#new-user-modal').modal('hide')
