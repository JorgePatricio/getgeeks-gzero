*Settings*
Documentation		Ajuda

*Keywords*

Obter token
	[Arguments]		${user}

	#Obtendo o token
	${payload}		Create Dictionary
	...				email=${user}[email]
	...				password=${user}[password]

	${response}		POST Session  ${payload}
	${result}		Set Variable	${EMPTY}

	IF	"200" in "${response}"
		${result}		Set Variable		Bearer ${response.json()}[token]
	END
	
	[Return]		${result}

Remover usuario
	[Arguments]		${user}

	${token}		Obter token  ${user}

	IF	"${token}"
		DELETE User  ${token}
	END