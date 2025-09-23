*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot
Library     DataDriver    ${CURDIR}/../../resources/testdata/quotation_rules.csv

Suite Setup       Open Fastwork Site    ${UI_SETTINGS['base_url']}
Suite Teardown    Close Browser Session

*** Test Cases ***
TC_UI_07_End_To_End_Quotation_Lifecycle_Termination_At_Round_Three
    [Documentation]    Buyer pays Round 1, approves work, starts Round 2, approves work, then terminates job at Round 3. Each step verifies the correct status update.
    [Tags]    ui    regression    quotation    milestone    lifecycle
    login_features.Login With Email And Password    ${USER_EMAIL}    ${USER_PASSWORD}
    freelancer_chat_features.Open Chat Inbox From Home
    freelancer_chat_features.Open Chat Thread For Freelancer And Product    ${FREELANCER_NAME}    ${PRODUCT_NAME}
    milestone_round_features.Complete Round One Payment And Approval With Expected Status
    ...    Paid    Approved
    milestone_round_features.Start Round Two And Approve With Expected Status
    ...    Round 2 Started    Approved
    milestone_round_features.Terminate Job At Round Three And Verify Status
    ...    Terminated