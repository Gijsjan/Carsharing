Template.Router.current_page = (page) -> 
	Session.equals('current_page', page)

MainRouter = Backbone.Router.extend
	
	routes:
		'': 'home'
		'users': 'userList'

	home: ->
		Session.set('current_page', 'home')
	
	userList: ->
		Session.set('current_page', 'users')

router = new MainRouter()