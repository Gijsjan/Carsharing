Template.TripList.trips = -> Trips.find()

Template.TripList.events =
	"click ul#trips li.trip": (e) ->
		_id = e.currentTarget.dataset.id
		Trips.remove(_id)