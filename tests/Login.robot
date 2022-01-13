*Settings* 
Documentation       Login test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Iniciar Sessao
Test Teardown   Finalizar Sessao

*Test Cases*

Usuário Login

    ${user}                             Factory Usuario Login

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
