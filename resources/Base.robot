*Settings*
Documentation       Base Test

Library     Browser
Library     Collections
Library     factories/Users.py
Library     Utils.py

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
    New Browser             ${BROWSER}    headless=${HEADLESS}  slowMo=00:00:00
    New Page                ${BASE_URL}
    Set Viewport Size       1280    768

Após Sessao
    ${shot_name}        Screenshot Name
    Take Screenshot     fullPage=True       filename=${shot_name}