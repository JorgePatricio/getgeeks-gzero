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