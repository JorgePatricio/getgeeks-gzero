*Settings*
Documentation       Seja um Geek test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Iniciar Sessao
Test Teardown   Finalizar Sessao

*Test Cases*

Seja um Geek

    ${user}     Factory Usuario Seja um Geek
     
    Fazer Login  ${user}
    Vai para formulário Geek
    Preencher formulário Geek  ${user}[perfil_geek]
    Submeter formulario geek

    
    Validar Formulario Geek


