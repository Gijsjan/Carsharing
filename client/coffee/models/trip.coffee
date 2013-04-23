class Trip extends Backbone.Model
	
	defaults: ->
		'date': moment().format('YYYY-MM-DD')
		'time': moment().format('HH:mm')
		'until_date': moment().add('days', 1).format('YYYY-MM-DD')
		'until_time': moment().format('HH:mm')
		'previous_mileage': 0
		'current_mileage': 0
		'distance': 0
		'occupants': Meteor.users.find().fetch()

	initialize: ->
		fn = =>
			if Trips? && Trips.length()
				@set 'previous_mileage', Trips.first().current_mileage
				Meteor.clearInterval(iv)
		iv = Meteor.setInterval fn, 100

@tripModel = new Trip();