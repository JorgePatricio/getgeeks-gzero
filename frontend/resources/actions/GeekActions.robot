*Settings*
Documentation       Geek Actions

*Keywords*
Vai para formulário Geek
    Click       css=a[href="/be-geek"] >> text=Seja um Geek
    Wait For Elements State     css=.be-geek-form       visible     5

Ir para busca geeks
    Click       css=a[href="/geeks"] >> text=
    Wait For Elements State     css=.title strong >> text=Estes são os Geeks disponíveis.
    ...                         visible     5

Preencher formulário Geek
    [Arguments]         ${perfil_geek}

    Resetar formulario Geek
    
    Fill Text       id=whatsapp     ${perfil_geek}[zap]
    Fill Text       id=desc         ${perfil_geek}[desc]

    IF      '${perfil_geek}[reparo_imp]'
        Select Options By       id=printer_repair       text       ${perfil_geek}[reparo_imp]
    END

    IF      '${perfil_geek}[trabalho]'
        Select Options By       id=work                 text       ${perfil_geek}[trabalho]
    END
    
    Fill Text       id=cost         ${perfil_geek}[custo_hora]

Preencher formulario de busca
    [Arguments]     ${target_option}       ${target_text}

    IF  '${target_option}'
        Select Options By   id=printer_repair       value       ${target_option}
    END

    Fill Text       id=desc                     ${target_text}


Submeter formulario geek
    Click       css=button >> text=Quero ser um Geek

Submeter formulario de busca
    Click       css=button[type="submit"] >> text=Buscar

Validar Formulario Geek
    ${mensagem_esperada}        Set Variable        Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State     css=p >> text=${mensagem_esperada}      visible     5

Resetar formulario Geek
    Execute Javascript      document.getElementsByClassName("be-geek-form")[0].reset();

Geek deve ser encontrado
    [Arguments]     ${geek}

    ${fullname}     Set Variable    ${geek}[nome] ${geek}[sobrenome]

    ${target_geek}       Get Element     xpath=//strong[contains(text(), "${fullname}")]/../../..

    ${work}         Convert To Lower Case       ${geek}[perfil_geek][work]

    Get Text        ${target_geek}   contains    Atendimento ${work}
    Get Text        ${target_geek}   contains    ${geek}[perfil_geek][desc]
    Get Text        ${target_geek}   contains    ${geek}[perfil_geek][cost]

    Set Suite Variable      ${target_geek}

Icone Alien deve ser visto
    Get Text        ${target_geek}   contains    👽

Geek not found
    Wait For Elements State     css=.search-not-found p >> text=Não encontramos Geeks com o(s) termo(s) informado na busca!
    ...                         visible     5