*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Click Login Button
    [Documentation]    Click on the login button to open login form
    Browser.Click    ${LOGIN_PAGE.LOGIN_BUTTON}

Input Email
    [Documentation]    Input user email address into the email field
    [Arguments]    ${email}
    Browser.Fill Text    ${LOGIN_PAGE.EMAIL_INPUT}    ${email}

Input Password
    [Documentation]    Input user password into the password field
    [Arguments]    ${password}
    Browser.Fill Text    ${LOGIN_PAGE.PASSWORD_INPUT}    ${password}

Click Submit Button
    [Documentation]    Click on the submit button to login
    Browser.Click    ${LOGIN_PAGE.SUBMIT_BUTTON}