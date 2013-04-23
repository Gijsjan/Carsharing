Template.ReservationList.reservations = -> Reservations.find({}, 'sort': 'date': -1, 'time': -1)

Template.ReservationList.events =

	"click .row": (e) -> alert(e.currentTarget.title);

	"click menu img.bin": (e) -> removeListItem(e, Reservations)

	"click menu img.edit": (ev) -> editListItem ev, Reservations