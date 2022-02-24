*Settings*
Documentation		Geeks route

*Keywords*

POST geek
	[Arguments]		${token}		${payload}

	${headers}		Create Dictionary		Authorization=${token}

	${response}		POST
	...				${API_GEEKS}/geeks
	...				json=${payload}
	...				headers=${headers}
	...				expected_status=any

	[Return]	${response}

Get geeks
	[Arguments]		${token}

	${headers}		Create Dictionary		Authorization=${token}

	${response}		GET
	...				${API_GEEKS}/geeks
	...				headers=${headers}
	...				expected_status=any

	[Return]	${response}