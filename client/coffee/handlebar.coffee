Handlebars.registerHelper 'formatted_date', (date, time) -> 
	moment(date + ' ' + time).format('MMMM Do YYYY, HH:mm')

Handlebars.registerHelper 'from', (date, time) -> moment(date + ' ' + time).from()

Handlebars.registerHelper 'date_now', -> moment().format('YYYY-MM-DD')
Handlebars.registerHelper 'time_now', -> moment().format('HH:mm')

Handlebars.registerHelper 'kms', (prev, curr) -> curr - prev

Handlebars.registerHelper 'given_names', (userIds) ->
	result = []
	users = Meteor.users.find '_id': '$in': userIds
	_.each users.fetch(), (user) -> result.push(user.services.google.given_name)
	result.join(', ')

Session.set('reservation', false)
Handlebars.registerHelper 'session_reservation', -> Session.get('reservation')

Session.set('edit', false)
Handlebars.registerHelper 'session_edit', -> Session.get('edit')