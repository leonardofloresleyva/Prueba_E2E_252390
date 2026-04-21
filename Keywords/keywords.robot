*** Settings ***
Library    SeleniumLibrary
Resource    ../Variables/variables.robot
*** Keywords ***
Initialize
    Open Browser    ${None}     ${browser}
    Go To           ${url}
    Maximize Browser Window

Wait_For_Element_Ready
    [Arguments]     ${element}
    Wait Until Element Is Visible       ${element}
    Wait Until Element Is Enabled       ${element}
Enter_Text
    [Arguments]     ${element}      ${value}
    Wait_For_Element_Ready    ${element}
    Input Text      ${element}      ${value}