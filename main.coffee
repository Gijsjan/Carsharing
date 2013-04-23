@Trips = new Meteor.Collection "trips"
@Reservations = new Meteor.Collection "reservations"
# @userData = new Meteor.Collection "userData"

ex =
	first: ->
		this.findOne()
	last: ->
		this.find().fetch()[this.length() - 1]
	length: ->
		this.find().count()

_.extend Trips, ex
_.extend Reservations, ex
# _.extend userData, ex