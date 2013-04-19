Template.TripForm.users = -> Meteor.users.find()

Template.TripForm.isCurrentUser = (id) -> 
	id is Meteor.userId()

Template.TripForm.created = ->
	fn = ->
		if Trips? && Trips.length()
			$('input[name=previous_mileage]').val Trips.first().current_mileage
			Meteor.clearInterval(iv)
	iv = Meteor.setInterval fn, 100

Template.TripForm.events =
	"click input[name=add]": (e) ->
		data = {}
		error = false
		
		_.each $('form#trip input'), (input) ->
			
			if input.type isnt 'submit' and input.type isnt 'checkbox'
				if _.isEmpty input.value
					$(input).css 'border', '1px solid red' # addClass
					error = true
				
				if input.id is 'previous_mileage' or input.id is 'current_mileage'
					data[input.name] = input.value >> 0
				else
					data[input.name] = input.value

			console.log data


			if input.type is 'checkbox' and input.checked
				data[input.name] = [] if not data[input.name]?
				data[input.name].push input.value

		if not data.occupants
			$('input[name=occupants]').css 'outline', '1px solid red' # addClass
			error = true

		if not error
			# TODO: remove error class
			Trips.insert data 

			$('input[name=previous_mileage]').val Trips.last().current_mileage
			$('input[name=current_mileage]').val ''
		
		false