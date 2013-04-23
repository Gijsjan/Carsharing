# Meteor.subscribe 'trips'
# Meteor.subscribe 'reservations'
# Meteor.subscribe 'users'



Meteor.startup ->
	mesub = (name) -> Meteor.subscribe name, -> true
	
	# async.every ['trips', 'reservations', 'users'], mesub, (result) -> console.log result
	fns =
		trips: (cb) ->
			Meteor.subscribe 'trips', -> cb null, true
		reservations: (cb) ->
			Meteor.subscribe 'reservations', -> cb null, true
		users: (cb) ->
			Meteor.subscribe 'users', -> cb null, true
	async.parallel fns, (err, result) ->
		console.log err
		console.log result

	Backbone.history.start 'pushState': true