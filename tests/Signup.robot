*Settings*
Documentation       Signup Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Iniciar Sessao
Test Teardown   Finalizar Sessao

*Test Cases*
Registrar novo usuário
    [Tags]      smoke

    ${user}         Factory Usuario        falso

    Vai para formulario de cadastro
    Preencher formulario de cadastro  ${user}
    Submeter formulario de cadastro
    Usuario deve estar cadastrado

Usuario Duplicado
    [Tags]      tentativa_cenario

    ${user}                             Factory Usuario        falso

    Adicionar Usuario pela Database     ${user}

    Vai para formulario de cadastro
    Preencher formulario de cadastro  ${user}
    Submeter formulario de cadastro
    Modal deve ser   Já temos um usuário com o e-mail informado.

Email Incorreto
    [Tags]      tentativa_cenario

    ${user}     Factory Usuario     email_errado

    Vai para formulario de cadastro
    Preencher formulario de cadastro  ${user}
    Submeter formulario de cadastro
    Notificação do campo deve ser  O email está estranho

Campos Obrigatórios
    [Tags]      tentativa_cenario       c_obr
    
    @{alertas_esperados}    Create List
    ...     Cadê o seu nome?
    ...     E o sobrenome?
    ...     O email é importante também!
    ...     Agora só falta a senha!
    
    Vai para formulario de cadastro
    Submeter formulario de cadastro
    Alertas do campo devem ser      ${alertas_esperados}
   

Senha Curta
    [Tags]      tentativa_cenario       senha_curta
    [Template]      Cadastro com senha curta
    1
    12
    123
    1234
    12345
    a2
    ab3
    ab3c
    ab3cd
    -1
    acb#1

*Keywords*

Cadastro com senha curta 
    [Arguments]         ${senha_curta}

    ${user}     Create Dictionary
    ...         nome=Jorge          sobrenome=Patricio
    ...         email=khennos@gmail.com     password=${senha_curta}

    Vai para formulario de cadastro
    Preencher formulario de cadastro  ${user}
    Submeter formulario de cadastro
    Notificação do campo deve ser       Informe uma senha com pelo menos 6 caracteres

