

def factory_user_session(target):

	name = 'Ildes Patricio'
	email = 'ildes@gmail.com'
	password = 'pwd123'

	data = {
		'signup': {
			'name': name,
			'email': email,
			'password': password
		},
		'login': {
			'email': email,
			'password': password
		}
	}
	return data[target]