*Settings*
Documentation       Tentativa de ser um Geek test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Iniciar Sessao para tentativa de ser Geek

*Variables*
${desc_longa}       escrever um bocado de coisa para tentar chegar aos 255 caracteres. Tem que ter um pouco de paciencia para isso, ou até mesmo... aff esqueci a palavra, na hora que a gente mais precisa e acabamos esquecendo as coisas. Pqp é vc que ta fudendo o meu teste de tamanho.

*Test Cases*
Não deve ser um geek
    [Template]      Tentar ser um Geek

    desc            Formato o seu PC        A descrição deve ter no minimo 80 caracteres
    desc            ${desc_longa}           A descrição deve ter no máximo 255 caracteres
    desc            ${EMPTY}                Informe a descrição do seu trabalho
    zap             11                      O Whatsapp deve ter 11 digitos contando com o DDD
    zap             999999999               O Whatsapp deve ter 11 digitos contando com o DDD
    zap             ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
    custo_hora      aaaa                    Valor hora deve ser numérico
    custo_hora      aa12                    Valor hora deve ser numérico
    custo_hora      $%#@                    Valor hora deve ser numérico
    custo_hora      ${EMPTY}                Valor hora deve ser numérico

*Keywords*

Tentar ser um Geek
    [Arguments]     ${chave}        ${campo_entrada}        ${mensagem_saida}

    ${user}     Factory Usuario     tentativa_ser_geek

    Set To Dictionary               ${user}[perfil_geek]    ${chave}     ${campo_entrada}

    Preencher formulário Geek       ${user}[perfil_geek]
    Submeter formulario geek
    Notificação do campo deve ser  ${mensagem_saida}

    Take Screenshot     fullPage=True

Iniciar Sessao para tentativa de ser Geek

    ${user}     Factory Usuario     tentativa_ser_geek
    
    Iniciar Sessao
    Fazer Login  ${user}
    Vai para formulário Geek

