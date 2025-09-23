*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Click Pay Button For Round One
    [Documentation]    Click the pay button for Round 1
    Browser.Click    ${ROUND.PAY_BUTTON}

Click Approve Work Button
    [Documentation]    Click approve work for the current round
    Browser.Click    ${ROUND.APPROVE_WORK_BUTTON}

Click Start Next Round Button
    [Documentation]    Click the start next round button to begin a new round
    Browser.Click    ${ROUND.START_NEXT_BUTTON}

Click Terminate Job Button
    [Documentation]    Click the terminate button to stop the job
    Browser.Click    ${ROUND.TERMINATE_BUTTON}

Verify Round Status Should Contain
    [Documentation]    Verify the round/job status contains expected text
    [Arguments]    ${expected}
    Browser.Wait For Elements State    ${ROUND.STATUS_LABEL}    visible    timeout=10s
    ${text}=    Browser.Get Text    ${ROUND.STATUS_LABEL}
    BuiltIn.Should Contain    ${text}    ${expected}