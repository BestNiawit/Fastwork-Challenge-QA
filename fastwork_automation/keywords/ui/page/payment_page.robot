*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Verify Redirected To Round One Payment Page
    [Documentation]    Verify that buyer is redirected to the Round 1 payment page
    Browser.Wait For Elements State    ${PAYMENT.ROUND_TITLE}    visible    timeout=10s
    ${title}=    Browser.Get Text    ${PAYMENT.ROUND_TITLE}
    BuiltIn.Should Contain    ${title}    1
    Browser.Wait For Elements State    ${PAYMENT.PAY_BUTTON}    visible    timeout=10s