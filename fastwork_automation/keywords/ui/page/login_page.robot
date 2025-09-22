*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Click fastwork login modal
    Browser.Click    ${login_page_locator.login_button_selector}

Input email on login form
    [Arguments]   ${email}
    Browser.Fill Text    ${login_page_locator.email_selector}   ${email} 

Input password on login form
    [Arguments]   ${password}
    Browser.Fill Text    ${login_page_locator.password_selector}   ${password}

Submit fastwork login form
    Browser.Click    ${login_page_locator.login_submit}