App.ApplicationController = Em.Controller.extend(
  # initial value of search box
  filteredShow = ''

  filterShow: (->
    # Get value of search box
    filteredShow = @get('filteredShow').toLowerCase()

    # Get contents of 'Shows' controller
    shows = @controllerFor('shows').get('arrangedContent')

    unless Em.isEmpty(filteredShow)
      shows.forEach (show) ->
        if show.get('show.title').toLowerCase().indexOf(filteredShow) >= 0
          show.set 'filtered', true
        else
          show.set 'filtered', false
    else
      shows.forEach (show) ->
        show.set 'filtered', false

  ).observes('filteredShow')
)
