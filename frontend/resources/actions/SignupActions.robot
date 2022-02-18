*Settings*
Documentation       Ações do Sistema

*Keywords*

Vai para formulario de cadastro

    Go To       ${BASE_URL}/signup
    Wait For Elements State     css=.signup-form    visible     5

Preencher formulario de cadastro
    [Arguments]     ${user}

    Fill Text       id=name         ${user}[nome]
    Fill Text       id=lastname     ${user}[sobrenome]
    Fill Text       id=email        ${user}[email]
    Fill Text       id=password     ${user}[password]

Submeter formulario de cadastro

    Click       css=.submit-button >> text=Cadastrar

Usuario deve estar cadastrado

    ${mensagem_esperada}        Set Variable       css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência. 
    Wait For Elements State     ${mensagem_esperada}        visible     5



Notificação do campo deve ser
    [Arguments]         ${expected_notice}

    Wait For Elements State     css=span[class=error] >> text=${expected_notice}        visible     5
