*Settings*
Documentation       Base Test

Library     Browser
Library     Collections
Library     factories/Users.py

Resource    actions/AuthActions.robot
Resource    actions/SignupActions.robot
Resource    actions/_SharedActions.robot
Resource    actions/GeekActions.robot

Resource    Database.robot
Resource    Helpers.robot

*Variables*
${BASE_URL}     https://getgeeks-jorge.herokuapp.com

*Keywords*
Iniciar Sessao
    New Browser     chromium    headless=False  slowMo=00:00:00.5
    New Page         ${BASE_URL}

Finalizar Sessao
    Take Screenshot