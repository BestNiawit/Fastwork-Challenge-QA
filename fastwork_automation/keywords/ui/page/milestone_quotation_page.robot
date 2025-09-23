*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Click Create Milestone Quotation Button
    [Documentation]    Click the button to start creating milestone quotation
    Browser.Click    ${QUOTATION.CREATE_BUTTON}

Click Add Round Button
    [Documentation]    Click to add a new round in the quotation form
    Browser.Click    ${QUOTATION.ADD_ROUND_BUTTON}

Input Round Title
    [Documentation]    Input title for a milestone round
    [Arguments]    ${title}
    Browser.Fill Text    ${QUOTATION.TITLE_INPUT}    ${title}

Input Round Description
    [Documentation]    Input description for a milestone round
    [Arguments]    ${desc}
    Browser.Fill Text    ${QUOTATION.DESCRIPTION_INPUT}    ${desc}

Input Round Deliverables
    [Documentation]    Input deliverables for a milestone round
    [Arguments]    ${deliverable}
    Browser.Fill Text    ${QUOTATION.DELIVERABLES_INPUT}    ${deliverable}

Input Round Amount
    [Documentation]    Input amount for a milestone round
    [Arguments]    ${amount}
    Browser.Fill Text    ${QUOTATION.AMOUNT_INPUT}    ${amount}

Input Round Date
    [Documentation]    Input delivery date for a milestone round
    [Arguments]    ${date}
    Browser.Fill Text    ${QUOTATION.DATE_INPUT}    ${date}

Click Submit Quotation Button
    [Documentation]    Submit the milestone quotation form
    Browser.Click    ${QUOTATION.SUBMIT_BUTTON}

Verify Quotation Status Should Be Pending Payment
    [Documentation]    Verify that the quotation status is "รอชำระ"
    Browser.Wait For Elements State    ${QUOTATION.STATUS_LABEL}    visible    timeout=10s
    ${text}=    Browser.Get Text    ${QUOTATION.STATUS_LABEL}
    BuiltIn.Should Contain    ${text}    รอชำระ

Verify Quotation Should Show Error
    [Documentation]    Verify that the quotation form shows validation error
    Browser.Wait For Elements State    xpath=//mock    visible    timeout=5s