window.App.promptForCredentialsTo = (service)->
  html = """
  <div class="modal hide fade">
    <form class="form-horizontal" id="user_credentials_form">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>Log in to #{service}</h3>
      </div>
      <div class="modal-body">
        <div class="control-group">
          <label class="control-label" for="user_credentials_login">Login</label>
          <div class="controls">
            <input type="text" id="user_credentials_login">
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="user_credentials_password">Password</label>
          <div class="controls">
            <input type="password" id="user_credentials_password">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Sign in</button>
      </div>
    </form>
  </div>
  """
  $modal = $(html).modal()
  $modal.on 'hidden', -> $(@).remove()
  $modal.on 'shown', (e)=>
    $input = $modal.find('input[type="text"]:first').select()
    $modal.find('button[type="submit"]').click (e)=>
      e.preventDefault()
      xhr = $.put '/credentials',
        service: service
        login: $modal.find('#user_credentials_login').val()
        password: $modal.find('#user_credentials_password').val()
      xhr.success ->
        $modal.modal('hide')
      xhr.error (response)->
        $form = $('#user_credentials_form')
        $form.find('.alert').remove()
        Errors.fromResponse(response).renderToAlert().prependTo $form
