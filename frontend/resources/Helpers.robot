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