*Settings* 
Documentation       Login test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Iniciar Sessao
Test Teardown   Finalizar Sessao

*Test Cases*

Usuário Login
    [Tags]      smoke
    ${user}                             Factory Usuario     login

    Ir para pagina login
    Preencher Credenciais    ${user}
    Submeter Credenciais
    Usuario deve estar logado       ${user}

Senha Incorreta
    [Tags]      senha_incorreta

    ${user}     Create Dictionary       email=khennos@gmail.com     password=abc123

    Ir para pagina login
    Preencher Credenciais  ${user}
    Submeter Credenciais
    Modal deve ser   Usuário e/ou senha inválidos.

Usuario não encontrado
    [Tags]      user_404

    ${user}     Create Dictionary       email=khennos@teste.com     password=abc123

    Ir para pagina login
    Preencher Credenciais  ${user}
    Submeter Credenciais
    Modal deve ser   Usuário e/ou senha inválidos.

Email Incorreto
    [Tags]      email_incorreto

    ${user}     Create Dictionary       email=khennos.com.br          password=abc123

    Ir para pagina login
    Preencher Credenciais  ${user}
    Submeter Credenciais
    Should Be Type Email

# Desafio 1 do módulo PRO

# Automatizar 3 novos casos de testes: Email Obrigatorio, Senha obrigatoria, Campos Obrigatorios

Email Obrigatório
    [Tags]     tentativa_obr    email_obr

    ${user}     Create Dictionary       email=            password=abc123
    
    @{alertas_esperados}    Create List
    ...     E-mail obrigatório
        
    Ir para pagina login
    Preencher Credenciais  ${user}
    Submeter Credenciais
    Alertas do campo devem ser      ${alertas_esperados}

Senha Obrigatória
    [Tags]     tentativa_obr        senha_obr

    ${user}     Create Dictionary            email=khennos@gmail.com        password=
    
    @{alertas_esperados}    Create List
    ...     Senha obrigatória
        
    Ir para pagina login
    Preencher Credenciais  ${user}
    Submeter Credenciais
    Alertas do campo devem ser      ${alertas_esperados}

Campos Obrigatórios
    [Tags]     tentativa_obr        campo_obr
    
    @{alertas_esperados}    Create List
    ...     E-mail obrigatório
    ...     Senha obrigatória
        
    Ir para pagina login
    Submeter Credenciais
    Alertas do campo devem ser      ${alertas_esperados}
