*Settings*
Documentation       Tentativa de ser um Geek test suite

Resource        ${EXECDIR}/resources/Base.robot

Suite Setup      Iniciar Sessao para tentativa de ser Geek
Test Template    Tentar Ser um Geek

*Variables*
${desc_longa}       escrever um bocado de coisa para tentar chegar aos 255 caracteres. Tem que ter um pouco de paciencia para isso, ou até mesmo... aff esqueci a palavra, na hora que a gente mais precisa e acabamos esquecendo as coisas. Pqp é vc que ta fudendo o meu teste de tamanho.

*Test Cases*

Descrição Curta                 desc            Formato o seu PC        A descrição deve ter no minimo 80 caracteres
Descrição Longa                 desc            ${desc_longa}           A descrição deve ter no máximo 255 caracteres
Descrição Vazia                 desc            ${EMPTY}                Informe a descrição do seu trabalho
Whatsapp só ddd                 zap             11                      O Whatsapp deve ter 11 digitos contando com o DDD
Whatsapp só número              zap             999999999               O Whatsapp deve ter 11 digitos contando com o DDD
Whatsapp Vazio                  zap             ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
Custo Letras                    custo_hora      aaaa                    Valor hora deve ser numérico
Custo Alpha                     custo_hora      aa12                    Valor hora deve ser numérico
Custo Caracteres Especiais      custo_hora      $%#@                    Valor hora deve ser numérico
Custo Vazio                     custo_hora      ${EMPTY}                Valor hora deve ser numérico
Não Reparar Impressora          reparo_imp      ${EMPTY}                Por favor, informe se você é um Geek Supremo
Sem trabalho                    trabalho        ${EMPTY}                Por favor, selecione o modelo de trabalho

*Keywords*

Tentar ser um Geek
    [Arguments]     ${chave}        ${campo_entrada}        ${mensagem_saida}

    ${user}     Factory Usuario     tentativa_ser_geek

    Set To Dictionary               ${user}[perfil_geek]    ${chave}     ${campo_entrada}

    Preencher formulário Geek       ${user}[perfil_geek]
    Submeter formulario geek
    Notificação do campo deve ser  ${mensagem_saida}

    Após Sessao

Iniciar Sessao para tentativa de ser Geek

    ${user}     Factory Usuario     tentativa_ser_geek
    
    Iniciar Sessao
    Fazer Login  ${user}
    Vai para formulário Geek

