TripList = new Meteor.Collection "TripList"

_.extend TripList,
	'first': ->
		this.findOne()
	'last': ->
		this.find().fetch()[this.length() - 1]
	'length': ->
		this.find().count()

if Meteor.isClient

	Template.TripList.trips = -> TripList.find()

	Template.TripForm.events =
		"click input[name=add]": (e) ->
			TripList.insert
				'date': $('input[name=date]').val()
				'time': $('input[name=time]').val()
				'previous_mileage': $('input[name=previous_mileage]').val()
				'current_mileage': $('input[name=current_mileage]').val()

			$('input[name=previous_mileage]').val TripList.last().current_mileage
			$('input[name=current_mileage]').val ''
			
			false

	Template.TripList.events =
		"click ul#trips li.trip": (e) ->
			_id = e.currentTarget.dataset.id
			TripList.remove(_id)

if Meteor.isServer
	Meteor.startup ->