*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Verify User Should Be Logged In
    [Documentation]    Verify that the user is logged in by checking the user menu
    Browser.Wait For Elements State    ${HOME_PAGE.USER_MENU}    visible    timeout=10s