App.ShowsController = Em.ArrayController.extend
  sortProperties: ['episode.first_aired_iso']
  sortAscending: true

  filteredContent: Em.computed.filterBy('arrangedContent', 'filtered', true)

  # Pagination stuff
  page      : 1
  perPage   : 10
  totalPages: (->
    Math.ceil @get('filteredContent').length / @get('perPage')
  ).property('length', 'perPage', 'filteredContent.[]')

  paginatedContent: (->
    start   = (@get('page') - 1) * @get('perPage')
    end     = @get('page') * @get('perPage')
    @get('filteredContent').slice(start, end)
  ).property('page', 'perPage', 'filteredContent.[]')

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

