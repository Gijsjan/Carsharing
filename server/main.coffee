Meteor.publish 'tripos', ->
	Trips.find(
		{}, 
		'sort': 
			'current_mileage': -1
	)
Meteor.publish 'users', ->
	Meteor.users.find()


	
Meteor.startup ->
	Accounts.validateNewUser (user) ->
		allowed_emails = ["agijsbro@gmail.com", "marieke1976@gmail.com", "h.nieuwendijk1@gmail.com"]
		
		if allowed_emails.indexOf(user.services.google.email) isnt -1
			return true
	
	Trips.allow
		insert: -> true
		update: -> true
		remove: -> true

	Meteor.users.allow
		insert: -> false
		update: -> false
		remove: -> false