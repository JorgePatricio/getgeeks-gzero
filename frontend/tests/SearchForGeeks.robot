*Settings*
Documentation       Search for geeks test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Iniciar Sessao
Test Teardown   Após Sessao

*Test Cases*

Search for Alien Geek

	${alien}	Factory Usuario		procurar_alien

	Create Geek Profile Service		${alien}

	${searcher}		Factory Usuario		searcher
	Fazer Login  ${searcher}

	Ir para busca geeks
	Preencher formulario de busca  Sim		Matricial a fita colorida
	Submeter formulario de busca

	Geek deve ser encontrado	${alien}
	Icone Alien deve ser visto

Search for Common Geek

	${comum}	Factory Usuario		procurar_comum

	Create Geek Profile Service		${comum}

	${searcher}		Factory Usuario		searcher
	Fazer Login  ${searcher}

	Ir para busca geeks
	Preencher formulario de busca  Não		PC, X86 ou X64
	Submeter formulario de busca

	Geek deve ser encontrado	${comum}

Search not found

	${searcher}		Factory Usuario		searcher
	Fazer Login  ${searcher}

	Ir para busca geeks
	Preencher formulario de busca  Não		Conserto Game Atari da Polivox
	Submeter formulario de busca
	Geek not found