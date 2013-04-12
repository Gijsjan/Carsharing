if Meteor.isClient
	
	Handlebars.registerHelper 'date', ->
		moment().format('YYYY-MM-DD')

	Handlebars.registerHelper 'time', ->
		moment().format('HH:mm')