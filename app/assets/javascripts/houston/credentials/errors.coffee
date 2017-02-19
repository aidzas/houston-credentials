class window.Errors extends window.Errors

  constructor: (response)->
    if response.status == 401
      if response.getResponseHeader('X-Credentials') == 'Missing Credentials'
        @missingCredentials = true
      else if response.getResponseHeader('X-Credentials') == 'Invalid Credentials'
        @invalidCredentials = true
      else if response.getResponseHeader('X-Credentials') == 'Oauth'
        @oauthLocation = response.getResponseHeader('Location')
      else
        message = response.responseText ? "You are not authorized"
        @errors = {base: [message]}
    else
      super
