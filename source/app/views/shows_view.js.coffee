App.ShowsView = Em.View.extend
  didInsertElement: ->
    @$('.pager__prev, .pager__next').on('click', ->
      $('html, body').animate({scrollTop: 0}, 500)
    )
