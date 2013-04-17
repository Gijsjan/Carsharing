@Trips = new Meteor.Collection "tripos"
@userData = new Meteor.Collection "userData"

ex =
	first: ->
		this.findOne()
	last: ->
		this.find().fetch()[this.length() - 1]
	length: ->
		this.find().count()

_.extend Trips, ex
_.extend userData, ex