*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables/variables.robot
*** Keywords ***
# Inicializa el navegador y la página de pruebas
Initialize
    Open Browser    ${None}     ${browser}
    Go To           ${url}
    Maximize Browser Window
# Espera hasta que el elemento recibido sea visible y esté habilitado
Wait_For_Element_Ready
    [Arguments]     ${element}
    Wait Until Element Is Visible       ${element}
    Wait Until Element Is Enabled       ${element}
# Ingresa el valor recibido en el elemento recibido
# Ideal cuando se desea ingresar valores a cada campo de un formulario
Enter_Text
    [Arguments]     ${element}      ${value}
    Wait_For_Element_Ready    ${element}
    Input Text      ${element}      ${value}