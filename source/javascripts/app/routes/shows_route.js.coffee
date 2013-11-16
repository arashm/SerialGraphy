App.ShowsRoute = Em.Route.extend
  model: ->
    App.Show.findAll()
