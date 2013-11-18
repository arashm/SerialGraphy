App.ShowsRoute = Em.Route.extend
  model: ->
    App.Show.findAll()

  actions:
    search: (showTitle) ->
      @controllerFor('application').set('filteredShow', showTitle)

    nextPage: ->
      @controller.incrementProperty('page')

    previousPage: ->
      @controller.decrementProperty('page')
