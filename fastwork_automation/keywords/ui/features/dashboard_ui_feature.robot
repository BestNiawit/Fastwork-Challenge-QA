*** Settings ***
Resource    ${CURDIR}/../../../keywords/import.robot

*** Keywords ***
Validate dashboard banner message
    ${notification}    Collections.Get From Dictionary    ${UI_FIXTURES}    notification_banner
    ${message}    Collections.Get From Dictionary    ${notification}    message
    BuiltIn.Should Not Be Empty    ${message}
    RETURN    ${message}
