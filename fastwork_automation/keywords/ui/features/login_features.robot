*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Login With Email And Password
    [Documentation]    Login using provided email and password, then verify user is logged in
    [Arguments]    ${email}    ${password}
    login_page.login Click Login Button
    login_page.Input Email Address Into Email Field    ${email}
    login_page.Input Password Into Password Field      ${password}
    login_page.Click Submit Button To Login
    login_page.Verify User Should Be Logged In