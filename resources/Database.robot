*Settings*
Documentation       Ajuda Database

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Conectar Postgres

    Connect To Database     psycopg2
    ...                     zmyjwmtd
    ...                     zmyjwmtd
    ...                     rCnfwH5yyq__18SrUrWM1ZteP_feRi5a
    ...                     castor.db.elephantsql.com
    ...                     5432

Reset Env

    Execute SQL String      DELETE from public.geeks;
    Execute SQL String      DELETE from public.users;

Inserir Usuario
    [Arguments]     ${u}

    ${hashed_pass}      Get Hashed Pass         ${u}[password]

    ${q}        Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${u}[nome] ${u}[sobrenome]', '${u}[email]', '${hashed_pass}', false)
    Execute SQL String    ${q}  

Users Seed

    ${user}     Factory Usuario     login
    Inserir Usuario  ${user}

    ${user2}    Factory Usuario     geek
    Inserir Usuario  ${user2}

    ${user3}    Factory Usuario     tentativa_ser_geek
    Inserir Usuario  ${user3}