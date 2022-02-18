*Settings*
Documentation			Sessions route test suite

Library		RequestsLibrary

*Variables*
${API_USERS}		https://getgeeks-users-jorge.herokuapp.com

*Test Cases*

Login do usuario

	${payload}		Create Dictionary		email=khennos@gmail.com		password=pwd123

	${response}		POST		${API_USERS}/sessions		json=${payload}		expected_status=any

	Status Should Be		200						${response}

	${size}					Get Length				${response.json()}[token]
	${expected_size}		Convert To Integer		140

	Should Be Equal			${expected_size}		${size}
	Should Be Equal			10d						${response.json()}[expires_in]

Senha Incorreta

	${payload}		Create Dictionary		email=khennos@gmail.com		password=abc123

	${response}		POST		${API_USERS}/sessions		json=${payload}		expected_status=any

	Status Should Be		401						${response}
	Should Be Equal			Unauthorized			${response.json()}[error]

Usuario não encontrado

	${payload}		Create Dictionary		email=khennos@401.com		password=abc123

	${response}		POST		${API_USERS}/sessions		json=${payload}		expected_status=any

	Status Should Be		401						${response}
	Should Be Equal			Unauthorized			${response.json()}[error]

Email incorreto

	${payload}		Create Dictionary		email=khennos.com		password=abc123

	${response}		POST		${API_USERS}/sessions		json=${payload}		expected_status=any

	Status Should Be		400						${response}
	Should Be Equal			Incorrect email			${response.json()}[error]

Email em branco

	${payload}		Create Dictionary		email=${EMPTY}		password=abc123

	${response}		POST		${API_USERS}/sessions		json=${payload}		expected_status=any

	Status Should Be		400						${response}
	Should Be Equal			Required email			${response.json()}[error]

Sem email

	${payload}		Create Dictionary		password=abc123

	${response}		POST		${API_USERS}/sessions		json=${payload}		expected_status=any

	Status Should Be		400						${response}
	Should Be Equal			Required email			${response.json()}[error]

Senha em branco

	${payload}		Create Dictionary		email=khennos@gmail.com		password=${EMPTY}

	${response}		POST		${API_USERS}/sessions		json=${payload}		expected_status=any

	Status Should Be		400						${response}
	Should Be Equal			Required pass			${response.json()}[error]

Sem senha

	${payload}		Create Dictionary		email=khennos@gmail.com

	${response}		POST		${API_USERS}/sessions		json=${payload}		expected_status=any

	Status Should Be		400						${response}
	Should Be Equal			Required pass			${response.json()}[error]