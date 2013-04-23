Template.TripList.trips = -> Trips.find({}, 'sort': 'current_mileage': -1)

@removeListItem = (ev, list) ->
	ev.stopPropagation()
	
	if window.confirm "Are you sure you want to remove this entry?"
		id = ev.currentTarget.parentNode.dataset.id
		list.remove id

@editListItem = (ev, list) ->
	ev.stopPropagation()

	Session.set('edit', true)
	isReservation = if list._name is 'reservations' then true else false
	Session.set('reservation', isReservation)

	id = ev.currentTarget.parentNode.dataset.id
	item = list.findOne '_id': id

	for own input_name, value of item
		$('#'+input_name).val value

Template.TripList.events =
	"click #triplist .row": (e) ->
		alert(e.currentTarget.title);

	"click #triplist menu img.bin": (e) -> 
		removeListItem(e, Trips)
		$('input[name=previous_mileage]').val(0) if Trips.find().count() is 0

	"click #triplist menu img.edit": (ev) -> editListItem ev, Trips