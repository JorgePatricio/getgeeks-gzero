*Settings*
Documentation       Shared Actions

*Keywords*

Modal deve ser 
    [Arguments]     ${mensagem_esperada}        

    ${title}        Set Variable     css=.swal2-title  
    ${content}      Set Variable     css=.swal2-html-container

    Wait For Elements State     ${title}        visible     5
    Get Text                    ${title}        equal       Oops...

    Wait For Elements State     ${content}      visible     5
    Get Text                    ${content}      equal       ${mensagem_esperada}

Alertas do campo devem ser
    [Arguments]     ${alertas_esperados}

    @{alertas_obtidos}      Create List     

    ${spans}        Get Elements        xpath=//span[@class="error"]

    FOR     ${span}     IN      @{spans}

        ${text}             GET Text                ${span}
        Append To List      ${alertas_obtidos}    ${text}

    END

    Lists Should Be Equal        ${alertas_esperados}        ${alertas_obtidos}