*Settings*
Documentation			Sessions route test suite

Resource		${EXECDIR}/resources/Base.robot

*Variables*
&{senha_invalida}		email=ildes@gmail.com		password=abc123
&{email_invalido}		email=ildes.com.br			password=abc123
&{email_404}			email=ildes@404.com			password=abc123
&{email_vazio}			email=${EMPTY}				password=abc123
&{Sem_campo_email}		password=abc123
&{Senha_vazia}			email=ildes@gmail.com		password=${EMPTY}
&{Sem_campo_senha}		email=ildes@gmail.com

*Test Cases*

Login do usuario

	#Dado que temos um usuario cadastrado
	${payload}		Factory User Session	signup
	POST User  ${payload}

	${payload}		Factory User Session	login

	#Quando faço uma requisição POST na rota /sessions
	${response}		POST Session  ${payload}

	#Então o status code deve ser 200
	Status Should Be		200						${response}

	#E deve gerar um token JWT
	${size}					Get Length				${response.json()}[token]
	Should Be True			${size} > 0

	Should Be Equal			${expected_size}		${size}
	
	#E esse token deve expirar em 10 dias
	Should Be Equal			10d						${response.json()}[expires_in]

Não deve gerar um token
	[Template]		Attempt POST Session

	${senha_invalida}		401		Unauthorized
	${email_invalido}		400		Incorrect email
	${email_404}			401		Unauthorized
	${email_vazio}			400		Required email
	${Sem_campo_email}		400		Required email
	${Senha_vazia}			400		Required pass
	${Sem_campo_senha}		400		Required pass	

*Keywords*

Attempt POST Session
	[Arguments]		${payload}		${status_code}		${error_message}

	${response}		POST Session		${payload}
	Status Should Be		${status_code}		${response}
	Should Be Equal			${error_message}	${response.json()}[error]