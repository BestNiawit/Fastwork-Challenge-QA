*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Input fastwork login form
    [Arguments]    ${email}    ${password}
    login_page.Input email on login form   ${email}
    login_page.Input password on login form   ${password}
    login_page.Submit fastwork login form