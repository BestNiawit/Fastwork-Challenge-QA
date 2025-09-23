*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Open Fastwork Site
    [Arguments]    ${url}
    Browser.New Browser          chromium    headless=${FALSE}
    Browser.New Context
    Browser.New Page             ${url}
    Browser.Wait For Elements State    //body    visible    timeout=10s

Close Browser Session
    Browser.Close Browser