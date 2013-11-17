App.ShowsController = Em.ArrayController.extend
  sortProperties: ['episode.first_aired_iso']
  sortAscending: true

  filteredContent: Em.computed.filterBy('arrangedContent', 'filtered', true)

  # Do we have any filtered content?
  # ToDo: Isn't it a little stupid?
  chosenContent: ->
    if Em.isEmpty(@get('filteredContent'))
      'arrangedContent' 
    else
      'filteredContent'

  # Pagination stuff
  page      : 1
  perPage   : 10
  totalPages: (->
    Math.ceil @get(@chosenContent()).length / @get('perPage')
  ).property('length', 'perPage', 'arrangedContent.[]', 'filteredContent.[]')

  paginatedContent: (->
    start   = (@get('page') - 1) * @get('perPage')
    end     = @get('page') * @get('perPage')
    @get(@chosenContent()).slice(start, end)
  ).property('page', 'perPage', 'arrangedContent.[]', 'filteredContent.[]')

  disableNextPage: (->
    @get('page') >= @get('totalPages')
  ).property('page', 'totalPages')

  disablePerviousPage: (->
    @get('page') <= 1
  ).property('page')

  actions:
    nextPage: ->
      @incrementProperty('page')

    previousPage: ->
      @decrementProperty('page')

