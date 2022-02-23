*Settings*
Documentation			Users route test suite

Resource		${EXECDIR}/resources/Base.robot

*Test Cases*

Adicionar novo usuario

	${user}		Factory New User

	Remover usuario  ${user}
	
	${response}			POST User  	${user}
	Status Should Be	201			${response}

	${user_id}			Set Variable	${response.json()}[id]
	Should Be True		${user_id} > 0

Obter dados do usuario

	${user}		Factory Obter Usuario
	POST User  ${user}

	${token}			Obter token  	${user}
	${response}			GET User  		${token}
	Status Should Be	200				${response}

	Should Be Equal As Strings		${user}[name]		${response.json()}[name]
	Should Be Equal As Strings		${user}[email]		${response.json()}[email]

	Should Be Equal As Strings		None				${response.json()}[whatsapp]
	Should Be Equal As Strings		None				${response.json()}[avatar]
	Should Be Equal As Strings		False				${response.json()}[is_geek]

Remover usuario

	#Dado que existe um usuario no sistema
	${user}		Factory Remover Usuario
	POST User  ${user}

	#E tenho um token desse usuario
	${token}			Obter token  	${user}

	#Quando faço uma solicitação de remoção na rota /users
	${response}			DELETE User  	${token}

	#Então deve retornar o status code 204 (no content)
	Status Should Be	204				${response}

	#E ao fazer uma requisição GET, deve retornar o status code 404 (not found)
	${response}			GET User  		${token}
	Status Should Be	404				${response}

Atualizar usuario

	${user}		Factory Atualizar Usuario
	POST User  ${user}[antes]

	${token}			Obter token  	${user}[antes]

	${response}			PUT User  		${token}  	${user}[depois]
	Status Should Be	200				${response}

	${response}			GET User  		${token}

	Should Be Equal As Strings		${user}[depois][name]					${response.json()}[name]
	Should Be Equal As Strings		${user}[depois][email]					${response.json()}[email]
	Should Be Equal As Strings		${user}[depois][whatsapp]				${response.json()}[whatsapp]
	Should Be Equal As Strings		${user}[depois][avatar]					${response.json()}[avatar]
	Should Be Equal As Strings		False									${response.json()}[is_geek]
