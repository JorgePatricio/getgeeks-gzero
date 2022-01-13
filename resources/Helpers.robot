*Settings*
Documentation       Ajuda para Testes

*Keywords*

Adicionar Usuario pela Database
    [Arguments]     ${user}
    
    Conectar Postgres
    Inserir Usuario  ${user}
    Disconnect From Database