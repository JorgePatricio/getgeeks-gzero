*Settings*
Documentation       Geek Actions

*Keywords*
Vai para formulário Geek
    Click       css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State     css=.be-geek-form       visible     5

Preencher formulário Geek
    [Arguments]         ${perfil_geek}

    Fill Text       id=whatsapp     ${perfil_geek}[zap]
    Fill Text       id=desc         ${perfil_geek}[desc]

    Select Options By       id=printer_repair       text       ${perfil_geek}[reparo_imp]
    Select Options By       id=work                 text       ${perfil_geek}[trabalho]

    Fill Text       id=cost         ${perfil_geek}[custo_hora]

Submeter formulario geek

    Click       css=button >> text=Quero ser um Geek

Validar Formulario Geek
    ${mensagem_esperada}        Set Variable        Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State     css=p >> text=${mensagem_esperada}      visible     5