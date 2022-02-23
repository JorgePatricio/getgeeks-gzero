
def factory_new_user():

	return {
		'name': 'Clint Barton',
		'email': 'barton@shield.com',
		'password': 'pwd123'
	}

def factory_obter_usuario():

	return {
		'name': 'Gwen Stacy',
		'email': 'stacy@hotmail.com',
		'password': 'pwd123'
	}

def factory_remover_usuario():

	return {
		'name': 'Thaddeus Ross',
		'email': 'ross@gmail.com',
		'password': 'pwd123'
	}

def factory_atualizar_usuario():

	email = 'jorgegspatricio@gmail.com'

	return {
		'antes': {
			'name': 'Patricio Jorge',
			'email': email,
			'password': 'pwd123'
		},
		'depois': {
			'name': 'Jorge Patricio',
			'email': email,
			'whatsapp': '7199999999911',
			'avatar': 'https://cdn.w600.comps.canstockphoto.com.br/menino-forre-desenho-caricatura-rosto-vetor-eps_csp62165539.jpg'
		}
	}

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