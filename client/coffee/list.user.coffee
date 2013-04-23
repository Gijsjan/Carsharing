Template.UserList.users = -> Meteor.users.find()

Template.UserList.events =
	"click ul#users li.user": (e) ->
		_id = e.currentTarget.dataset.id
		Meteor.users.remove(_id)