
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


def factory_seja_um_geek():

	return {
		'name': 'Teste automatizado',
		'email': 'teste@gmail.com',
		'password': 'pwd123',
		'geek_profile': {
			'whatsapp': '71999999999',
  			'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
  			'printer_repair': 'Sim',
  			'work': 'Presencial',
  			'cost': '150.99'
		}
	}

def factory_procurar_por_geeks():
	return {
		'user': {
			'name': 'Peter Quill',
			'email': 'quill@marvel.com',
			'password': 'pwd123',
		},
		'geeks': [
			{
				'name': 'Riri Willians',
				'email': 'riri@gmail.com',
				'password': 'pwd123',
				'geek_profile': {
					'whatsapp': '71999999999',
					'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
					'printer_repair': 'Não',
					'work': 'Presencial',
					'cost': '100'
				}
			},
			{
				'name': 'Armin Zola',
				'email': 'zola@gmail.com',
				'password': 'pwd123',
				'geek_profile': {
					'whatsapp': '21999999999',
					'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
					'printer_repair': 'Não',
					'work': 'Ambos',
					'cost': '190'
				}
			},
			{
				'name': 'Reed Richards',
				'email': 'reed@fantastic4.com',
				'password': 'pwd123',
				'geek_profile': {
					'whatsapp': '55999999999',
					'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
					'printer_repair': 'Sim',
					'work': 'Ambos',
					'cost': '245.88'
				}
			}
		]
	}