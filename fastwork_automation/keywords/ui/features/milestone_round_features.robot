*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Complete Round One Payment And Approval With Expected Status
    [Documentation]    Buyer pays for Round 1 and approves work, verifying both statuses dynamically
    [Arguments]    ${status_1}   ${status_2}
    milestone_round_page.Click Pay Button For Round One
    milestone_round_page.Verify Round Status Should Contain    ${status_1}
    milestone_round_page.Click Approve Work Button
    milestone_round_page.Verify Round Status Should Contain    ${status_2}

Start Round Two And Approve With Expected Status
    [Documentation]    Buyer starts Round 2 and approves work, verifying statuses dynamically
    [Arguments]    ${status_1}   ${status_2}
    milestone_round_page.Click Start Next Round Button
    milestone_round_page.Verify Round Status Should Contain    ${status_1}
    milestone_round_page.Click Approve Work Button
    milestone_round_page.Verify Round Status Should Contain    ${status_2}

Terminate Job At Round Three And Verify Status
    [Documentation]    Buyer terminates the job at Round 3 and verifies termination status
    [Arguments]    ${status}
    milestone_round_page.Click Terminate Job Button
    milestone_round_page.Verify Round Status Should Contain    ${status}