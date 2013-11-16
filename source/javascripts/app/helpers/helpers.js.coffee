Em.Handlebars.helper 'showDescription', (value, options) ->
  if value.length == 0
    new Handlebars.SafeString '<p class=\'show__nodesc\'>No description for this episode.</p>'
  else
    value

Em.Handlebars.helper 'formatDate', (value, options) ->
  moment(value).fromNow()
