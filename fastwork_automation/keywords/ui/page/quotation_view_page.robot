*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Open Received Quotation
    [Documentation]    Open the received quotation from quotation list
    Browser.Click    ${QUOTATION_VIEW.QUOTATION_CARD}

Click Approve Work Button
    [Documentation]    Click the approve work button on quotation detail page
    Browser.Click    ${QUOTATION_VIEW.APPROVE_BUTTON}

Verify Quotation Status Should Be Accepted
    [Documentation]    Verify that quotation status is updated to Accepted
    Browser.Wait For Elements State    ${QUOTATION_VIEW.STATUS_LABEL}    visible    timeout=10s
    ${text}=    Browser.Get Text    ${QUOTATION_VIEW.STATUS_LABEL}
    BuiltIn.Should Contain    ${text}    Accepted