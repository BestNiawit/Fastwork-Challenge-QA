*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot
Library     DataDriver    ${CURDIR}/../../resources/testdata/quotation_rules.csv

Suite Setup       Open Fastwork Site    ${UI_SETTINGS['base_url']}
Suite Teardown    Close Browser Session

*** Test Cases ***
TC_UI_07_End_To_End_Quotation_Lifecycle_Termination_At_Round_Three
    [Documentation]    Buyer pays Round 1, approves work, starts Round 2, approves work, then terminates job at Round 3. Each step verifies the correct status update.
    [Tags]    ui    regression    quotation    milestone    lifecycle
    login_features.Login With Email And Password    ${TC_UI_07['user']}    ${TC_UI_07['password']}
    freelancer_chat_features.Open Chat Inbox From Home
    freelancer_chat_features.Open Chat Thread For Freelancer And Product    ${TC_UI_07['chat']['freelancer_name']}    ${TC_UI_07['chat']['product_name']}
    milestone_round_features.Complete Round One Payment And Approval With Expected Status
    ...    ${TC_UI_07['expected_status']['round1_payment']}
    ...    ${TC_UI_07['expected_status']['round1_approval']}

    milestone_round_features.Start Round Two And Approve With Expected Status
    ...    ${TC_UI_07['expected_status']['round2_start']}
    ...    ${TC_UI_07['expected_status']['round2_approval']}

    milestone_round_features.Terminate Job At Round Three And Verify Status
    ...    ${TC_UI_07['expected_status']['round3_terminate']}