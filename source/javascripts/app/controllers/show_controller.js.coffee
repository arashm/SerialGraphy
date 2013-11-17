App.ShowController = Em.ObjectController.extend
  imdbLink: (->
    "http://imdb.com/title/" + @get('show.imdb_id')
  ).property()
