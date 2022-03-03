*Settings*
Documentation       Ajuda para Testes

*Keywords*

Adicionar Usuario pela Database
    [Arguments]     ${user}
    
    Conectar Postgres
    Inserir Usuario  ${user}
    Disconnect From Database

Fazer Login
    [Arguments]     ${user}

    Ir para pagina login
    Preencher Credenciais  ${user}
    Submeter Credenciais
    Usuario deve estar logado  ${user}

Create Geek Profile Service
    [Arguments]     ${user}

    ${token}    Get Token Service   ${user}

	Be a Geek Service       ${user}[perfil_geek]     ${token}