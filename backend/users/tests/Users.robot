*Settings*
Documentation			Users route test suite

Resource		${EXECDIR}/resources/Base.robot

*Test Cases*

Adicionar novo usuario

	${user}		Factory New User

	Remover usuario  ${user}
	
	${response}			POST User  	${user}
	Status Should Be	201			${response}