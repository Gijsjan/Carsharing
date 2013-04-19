Template.TripList.trips = -> Trips.find({}, 'sort': 'current_mileage': -1)

Template.TripList.events =
	"click #triplist .row": (e) ->
		alert(e.currentTarget.title);

	"click #triplist .row .remove": (e) ->
		e.stopPropagation()
		
		if window.confirm "Are you sure you want to remove this entry?"
			_id = e.currentTarget.dataset.id
			Trips.remove(_id)
			
			$('input[name=previous_mileage]').val(0) if Trips.find().count() is 0 