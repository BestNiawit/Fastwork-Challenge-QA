*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot
Library     DataDriver    ${CURDIR}/../../resources/testdata/quotation_rules.csv

Suite Setup       Open Fastwork Site    ${UI_SETTINGS['base_url']}
Suite Teardown    Close Browser Session

*** Test Cases ***
TC_UI_05_Validate_Quotation_Rules
    [Documentation]    Validate system enforces rules with data-driven test sets
    [Tags]    ui    regression    quotation    validation
    login_features.Login With Email And Password    ${TC_UI_05['user']}    ${TC_UI_05['password']}
    freelancer_chat_features.Open Chat Inbox From Home
    freelancer_chat_features.Open Chat Thread For Freelancer And Product    ${TC_UI_05['chat']['freelancer_name']}    ${TC_UI_05['chat']['product_name']}
    Fill Quotation Form With Test Data    ${rounds}    ${amounts}    ${total}    ${date}
    BuiltIn.Run Keyword If    '${expected}' == 'pass'    milestone_quotation_page.Verify Quotation Status Should Be Pending Payment
    BuiltIn.Run Keyword If    '${expected}' == 'fail'    milestone_quotation_page.Verify Quotation Should Show Error