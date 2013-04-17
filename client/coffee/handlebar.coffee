Handlebars.registerHelper 'date', -> moment().format('YYYY-MM-DD')

Handlebars.registerHelper 'time', -> moment().format('HH:mm')

Handlebars.registerHelper 'given_names', (userIds) ->
	result = []
	users = Meteor.users.find '_id': '$in': userIds
	_.each users.fetch(), (user) -> result.push(user.services.google.given_name)
	result.join(', ')