*Settings*
Documentation       Ações de autenticação

*Variables*
${INPUT_EMAIL}      id=email
${INPUT_PASS}       id=password

*Keywords*

Ir para pagina login
    Go To       ${BASE_URL}
    Wait For Elements State     css=.login-form     visible     5

Preencher Credenciais
    [Arguments]         ${user}

    Fill Text       ${INPUT_EMAIL}          ${user}[email]
    Fill Text       ${INPUT_PASS}           ${user}[password]

Submeter Credenciais

    Click       css=.submit-button >> text=Entrar

Usuario deve estar logado
    [Arguments]     ${user}

    ${element}              Set Variable        id=user
    ${nome_esperado}        Set Variable        ${user}[nome] ${user}[sobrenome]

    Wait For Elements State     ${element}     visible     5
    Get Text                    ${element}     equal       ${nome_esperado}

Should Be Type Email
    Get Property       ${INPUT_EMAIL}    type    equal   email