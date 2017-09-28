$("<%= escape_javascript(render 'users/user_row', u: @user) %>").appendTo('#user-table tbody')
$('#user-new-modal').modal('hide')
