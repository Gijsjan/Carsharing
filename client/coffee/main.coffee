Meteor.subscribe 'tripos'
Meteor.subscribe 'users'

Meteor.startup ->
	
	Backbone.history.start 'pushState': true
