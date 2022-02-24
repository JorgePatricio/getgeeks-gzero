*Settings*
Documentation		Geek route test suite

Resource		${EXECDIR}/resources/Base.robot

*Test Cases*

Be a geek

	#Dado que temos um novo usuario
	${user}		Factory Seja um Geek
	Remover usuario  ${user}

	#E esse usuario é um cliente comum
	POST User  	${user}

	#E esse usuario possuir um token valido
	${token}	Obter token  		${user}

	#Quando faço uma requisição POST na rota /geeks
	${response}		POST geek		${token}		${user}[geek_profile]

	#Então deve retornar 201
	Status Should Be		201		${response}

	#E ao consultar esse usuário na API users
	${response}		GET User  ${token}

	#Então o perfil geek deve ser retornado
	Should Be Equal As Strings		${user}[name]										${response.json()}[name]
	Should Be Equal As Strings		${user}[email]										${response.json()}[email]
	Should Be Equal As Strings		${user}[geek_profile][whatsapp]						${response.json()}[whatsapp]
	Should Be Equal As Strings		${user}[geek_profile][desc]							${response.json()}[desc]

	${expected_float}		Convert To Number		${user}[geek_profile][cost]
	${got_float}			Convert To Number		${response.json()}[cost]

	Should Be Equal					${expected_float}									${got_float}
	Should Be Equal As Strings		${user}[geek_profile][printer_repair]				${response.json()}[printer_repair]
	Should Be Equal As Strings		${user}[geek_profile][work]							${response.json()}[work]
	Should Be Equal As Strings		None												${response.json()}[avatar]
	Should Be Equal As Strings		True												${response.json()}[is_geek]

Obter lista geek

	${data}		Factory Procurar Por Geeks

	FOR		${geek}		IN		@{data}[geeks]

		POST User  ${geek}
		${token}	Obter token  ${geek}
		POST geek  ${token}  ${geek}[geek_profile]

	END

	POST User  ${data}[user]

	${token}	Obter token  	${data}[user]

	${response}		Get geeks  	${token}

	Status Should Be	200		${response}

	${total}		Get Length		${response.json()}[Geeks]
	Should Be True		${total} > 0