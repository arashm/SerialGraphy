App.Show = Em.Object.extend()

App.Show.reopenClass
   # App.Show.findAll()
   findAll: ->
      url = 'http://serialgraphy.com/api/?callback=?'
      
      $.getJSON(url).then (data) ->
         today = new Date
         shows = Em.A()
         data.forEach (date) ->
            # I create objects based on episodes  array. I don't need date now.
            date.episodes.forEach (show) ->
               # We don't want aired shows
               show.filtered = true
               unless new Date(show.episode.first_aired_iso) < today
                  shows.pushObject(App.Show.create(show))
         shows

# Sample of data coming from json call
#    {
#       "date":"2013-11-09",
#       "episodes":[
#          {
#             "show":{
#                "title":"SAF3",
#                "year":2013,
#                "url":"http:\/\/trakt.tv\/show\/saf3",
#                "first_aired":1379746800,
#                "first_aired_iso":"2013-09-21T00:00:00-04:00",
#                "first_aired_localized":1379746800,
#                "first_aired_utc":1379736000,
#                "country":"United States",
#                "overview":"The series follows Southern California's elite rescue task force, SAF3 (pronouced \"safe\") , consists of the cream-of-the-crop from the sea, air, and fire divisions of the Malibu Fire Department. They are the heroes who answer the most challenging calls; specialists who collaborate, coordinate, and initiate daring rescues in the most dangerous venues to save human life, always aware of the harsh reality that one of them may not return.",
#                "runtime":60,
#                "network":"Syndication",
#                "air_day":"Saturday",
#                "air_day_localized":"Saturday",
#                "air_day_utc":"Friday",
#                "air_time":"12:00am",
#                "air_time_localized":"12:00am",
#                "air_time_utc":"9:00pm",
#                "certification":"",
#                "imdb_id":"tt2497788",
#                "tvdb_id":"273493",
#                "tvrage_id":"38006",
#                "images":{
#                   "poster":"http:\/\/slurm.trakt.us\/images\/posters\/28701.jpg",
#                   "fanart":"http:\/\/slurm.trakt.us\/images\/fanart\/28701.jpg",
#                   "banner":"http:\/\/slurm.trakt.us\/images\/banners\/28701.jpg"
#                },
#                "ratings":{
#                   "percentage":45,
#                   "votes":2,
#                   "loved":0,
#                   "hated":2
#                },
#                "genres":[
#                   ""
#                ]
#             },
#             "episode":{
#                "season":1,
#                "number":8,
#                "title":"Vigilance",
#                "overview":"",
#                "url":"http:\/\/trakt.tv\/show\/saf3\/season\/1\/episode\/8",
#                "first_aired":1383984000,
#                "first_aired_iso":"2013-11-09T00:00:00-05:00",
#                "first_aired_localized":1383984000,
#                "first_aired_utc":1383973200,
#                "images":{
#                   "screen":"http:\/\/slurm.trakt.us\/images\/fanart\/28701-940.jpg"
#                },
#                "ratings":{
#                   "percentage":0,
#                   "votes":0,
#                   "loved":0,
#                   "hated":0
#                }
#             }
#          },
#          {
#             "show":{
#                "title":"The Thundermans",
#                "year":2013,
#                "url":"http:\/\/trakt.tv\/show\/the-thundermans",
#                "first_aired":1381809600,
#                "first_aired_iso":"2013-10-14T21:00:00-04:00",
#                "first_aired_localized":1381809600,
#                "first_aired_utc":1381798800,
#                "country":"United States",
#                "overview":"Meet The Thundermans, a typical suburban family that happens to have astounding superpowers. At the center of the action are the 14-year-old Thunderman twins, who share the same bathroom, the same school, and the same annoying little siblings. Their only difference? The sister is a super student with a super sunny disposition who super looks forward to being a superhero someday, and her twin brother is a super villain.",
#                "runtime":30,
#                "network":"Nickelodeon",
#                "air_day":"Monday",
#                "air_day_localized":"Monday",
#                "air_day_utc":"Monday",
#                "air_time":"9:00pm",
#                "air_time_localized":"9:00pm",
#                "air_time_utc":"6:00pm",
#                "certification":"",
#                "imdb_id":"tt2712516",
#                "tvdb_id":"274283",
#                "tvrage_id":"32627",
#                "images":{
#                   "poster":"http:\/\/slurm.trakt.us\/images\/posters\/29191.jpg",
#                   "fanart":"http:\/\/slurm.trakt.us\/images\/fanart\/29191.jpg",
#                   "banner":"http:\/\/slurm.trakt.us\/images\/banners\/29191.jpg"
#                },
#                "ratings":{
#                   "percentage":30,
#                   "votes":1,
#                   "loved":0,
#                   "hated":1
#                },
#                "genres":[
#                   "Comedy",
#                   "Family",
#                   "Science Fiction"
#                ]
#             },
#             "episode":{
#                "season":1,
#                "number":3,
#                "title":"Dinner Party",
#                "overview":"",
#                "url":"http:\/\/trakt.tv\/show\/the-thundermans\/season\/1\/episode\/3",
#                "first_aired":1384059600,
#                "first_aired_iso":"2013-11-09T21:00:00-05:00",
#                "first_aired_localized":1384059600,
#                "first_aired_utc":1384048800,
#                "images":{
#                   "screen":"http:\/\/slurm.trakt.us\/images\/fanart\/29191-940.jpg"
#                },
#                "ratings":{
#                   "percentage":0,
#                   "votes":0,
#                   "loved":0,
#                   "hated":0
#                }
#             }
#          }
#       ]
#    },
#    {
#       "date":"2013-11-10",
#       "episodes":[
#          {
#             "show":{
#                "title":"When Ghosts Attack",
#                "year":2013,
#                "url":"http:\/\/trakt.tv\/show\/when-ghosts-attack",
#                "first_aired":0,
#                "first_aired_iso":"1969-12-31T16:00:00-05:00",
#                "first_aired_localized":0,
#                "first_aired_utc":-10800,
#                "country":"United States",
#                "overview":"Watch When Ghosts Attack, if you dare. Destination America's all-new series flickers to life just in time for Halloween season to expose what happens when an unseen, evil entity not only reveals itself to the living but strikes with terrifying force. In the eight-episode first season of When Ghosts Attack, travel to the dark side of the paranormal world, where poltergeist activity - like objects moving on their own - is child's play compared to the torment of a malevolent demon. Told from the first-person perspective of the victims and their loved ones, each episode uncovers multiple ghostly attacks. Hear first-hand what went through the victim's mind as their experience escalated from threatening whispers and dark omens to scratches, shoves, and the anguish of having to live alongside their invisible enemy. (Source: Destination America)",
#                "runtime":60,
#                "network":"Destination America",
#                "air_day":"Wednesday",
#                "air_day_localized":"Wednesday",
#                "air_day_utc":"Wednesday",
#                "air_time":"4:00pm",
#                "air_time_localized":"4:00pm",
#                "air_time_utc":"1:00pm",
#                "certification":"",
#                "imdb_id":"tt3205228",
#                "tvdb_id":"274535",
#                "tvrage_id":"37935",
#                "images":{
#                   "poster":"http:\/\/slurm.trakt.us\/images\/posters\/29349.jpg",
#                   "fanart":"http:\/\/slurm.trakt.us\/images\/fanart-dark.jpg",
#                   "banner":"http:\/\/slurm.trakt.us\/images\/banners\/29349.jpg"
#                },
#                "ratings":{
#                   "percentage":60,
#                   "votes":1,
#                   "loved":1,
#                   "hated":0
#                },
#                "genres":[
#                   ""
#                ]
#             },
#             "episode":{
#                "season":1,
#                "number":4,
#                "title":"Attack from the Past",
#                "overview":"When a family gets the opportunity to move to scenic Frederick, Md., they jump at the chance. Little do they know they are moving in with evil entities that will do anything to scare them away. When the macabre presence violently threatens a priest, the family fears the vicious spirits will kill them.\n\nOver in Gloucester, Va., Brian Schiff and three friends discover an eerie, abandoned house with a local legend. When the door opens and creepily beckons them in, the friends are not prepared for the terrifying attack that plagues them.\n\nA Winchester, Va., estate with more than 150 years of history has its owners terrified and fearing for their safety after a ghost investigator experiences a violent encounter. ",
#                "url":"http:\/\/trakt.tv\/show\/when-ghosts-attack\/season\/1\/episode\/4",
#                "first_aired":0,
#                "first_aired_iso":"1969-12-31T16:00:00-05:00",
#                "first_aired_localized":0,
#                "first_aired_utc":-10800,
#                "images":{
#                   "screen":"http:\/\/slurm.trakt.us\/images\/episode-dark.jpg"
#                },
#                "ratings":{
#                   "percentage":0,
#                   "votes":0,
#                   "loved":0,
#                   "hated":0
#                }
#             }
#          },
#          {
#             "show":{
#                "title":"Shake It Up",
#                "year":2010,
#                "url":"http:\/\/trakt.tv\/show\/shake-it-up",
#                "first_aired":1289183400,
#                "first_aired_iso":"2010-11-07T18:30:00-05:00",
#                "first_aired_localized":1289183400,
#                "first_aired_utc":1289172600,
#                "country":"United States",
#                "overview":"Best friends CeCe Jones and Rachel \"Rocky\" Blue have dreamed about becoming professional dancers ever since they were little girls. Their big break finally comes when the girls land roles as backup dancers on a local Chicago TV dance show, \"Shake It Up, Chicago!\". As the girls pop, lock, and learn challenging dance moves for each week's show, they revel in their newfound status but also quickly learn they'll need more than fancy footwork to match wits with the show's other dancers, notably the highly competitive siblings Gunther and Tinka. At the same time, with their best friend Deuce and Rocky's brother Ty, they must quickstep through the complex twists and turns of an average big-city high school as well as Windy City family life, including their obligation to babysit CeCe's mischievous younger brother, Flynn.",
#                "runtime":30,
#                "network":"Disney Channel",
#                "air_day":"Sunday",
#                "air_day_localized":"Sunday",
#                "air_day_utc":"Sunday",
#                "air_time":"6:30pm",
#                "air_time_localized":"6:30pm",
#                "air_time_utc":"3:30pm",
#                "certification":"TV-G",
#                "imdb_id":"tt1661326",
#                "tvdb_id":"205251",
#                "tvrage_id":"25778",
#                "images":{
#                   "poster":"http:\/\/slurm.trakt.us\/images\/posters\/759.jpg",
#                   "fanart":"http:\/\/slurm.trakt.us\/images\/fanart\/759.jpg",
#                   "banner":"http:\/\/slurm.trakt.us\/images\/banners\/759.jpg"
#                },
#                "ratings":{
#                   "percentage":68,
#                   "votes":25,
#                   "loved":18,
#                   "hated":7
#                },
#                "genres":[
#                   "Comedy",
#                   "Family"
#                ]
#             },
#             "episode":{
#                "season":3,
#                "number":26,
#                "title":"Remember Me",
#                "overview":"In the series finale, \"Shake It Up Chicago\" hosts a charity fashion show with Rocky, Tinka and CeCe as its star models, however the girls' runway dreams are cut short when a fashion mishap leaves CeCe with amnesia. While Georgia and Flynn try to follow the doctor's orders and give CeCe time to heal, a devastated Rocky tries everything she can to get her best friend to remember her and the special memories they shared.",
#                "url":"http:\/\/trakt.tv\/show\/shake-it-up\/season\/3\/episode\/26",
#                "first_aired":1384137000,
#                "first_aired_iso":"2013-11-10T18:30:00-05:00",
#                "first_aired_localized":1384137000,
#                "first_aired_utc":1384126200,
#                "images":{
#                   "screen":"http:\/\/slurm.trakt.us\/images\/episodes\/759-3-26.jpg"
#                },
#                "ratings":{
#                   "percentage":0,
#                   "votes":0,
#                   "loved":0,
#                   "hated":0
#                }
#             }
#          }
#       ]
#     }
