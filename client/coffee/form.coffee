Template.TripForm.users = -> Meteor.users.find()

Template.TripForm.isCurrentUser = (id) -> 
	id is Meteor.userId()

Template.TripForm.created = ->
	console.log tripModel.get('previous_mileage')
	# fn = ->
	# 	if Trips? && Trips.length()
	# 		$('input[name=previous_mileage]').val Trips.first().current_mileage
	# 		Meteor.clearInterval(iv)
	# iv = Meteor.setInterval fn, 100

Template.TripForm.events =

	"change input[name=multiple_days]": (e) ->
		if e.currentTarget.checked
			$('#until').show()
		else
			$('#until').hide()
	
	"change input[name=date]": (e) ->
		start = moment(e.currentTarget.value + ' ' + $('#time').val())
		now = moment()
		if now.diff(start) < 0
			Session.set('reservation', true)
		else
			Session.set('reservation', false)

	"change input[name=time]": (e) ->
		start = moment($('#date').val() + ' ' + e.currentTarget.value)
		now = moment()
		if now.diff(start) < 0
			Session.set('reservation', true)
		else
			Session.set('reservation', false)

	"click input[name=cancel]": (e) ->
		Session.set 'reservation', false
		Session.set 'edit', false

		false

	"click input[name=add]": (e) ->
		data = {}
		error = false
		
		_.each $('form#trip input'), (input) ->
			
			if input.type isnt 'checkbox'
				if input.id is 'previous_mileage' or input.id is 'current_mileage'
					if _.isEmpty input.value
						$(input).css 'border', '1px solid red' # addClass
						error = true
					data[input.name] = input.value >> 0
				else
					data[input.name] = input.value

			else if input.type is 'checkbox' and input.checked
				data[input.name] = [] if not data[input.name]?
				data[input.name].push input.value

		if not data.occupants
			$('input[name=occupants]').css 'outline', '1px solid red' # addClass
			error = true

		# If multiple_days isnt checked remove the default values for
		# until_date and until_time. If multiple_days is checked, remove
		# data.multiple_days (= ['on']) so it won't be written to db.
		if not data.multiple_days
			delete data.until_date
			delete data.until_time
		else
			delete data.multiple_days

		if Session.get('reservation') and not error
			delete data.previous_mileage
			delete data.current_mileage

			Reservations.insert data
		else if not error			
			Trips.insert data 

			$('input[name=previous_mileage]').val Trips.last().current_mileage
			$('input[name=current_mileage]').val ''
		# TODO: remove error class
		
		false