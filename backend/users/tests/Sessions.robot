*Settings*
Documentation			Sessions route test suite

Resource		${EXECDIR}/resources/Base.robot

*Variables*
&{senha_invalida}		email=khennos@gmail.com		password=abc123
&{email_invalido}		email=khennos.com.br		password=abc123
&{email_404}			email=khennos@404.com		password=abc123
&{email_vazio}			email=${EMPTY}				password=abc123
&{Sem_campo_email}		password=abc123
&{Senha_vazia}			email=khennos@gmail.com		password=${EMPTY}
&{Sem_campo_senha}		email=khennos@gmail.com

*Test Cases*

Login do usuario

	${payload}		Create Dictionary		email=khennos@gmail.com		password=pwd123

	${response}		POST Session  ${payload}

	Status Should Be		200						${response}

	${size}					Get Length				${response.json()}[token]
	${expected_size}		Convert To Integer		140

	Should Be Equal			${expected_size}		${size}
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