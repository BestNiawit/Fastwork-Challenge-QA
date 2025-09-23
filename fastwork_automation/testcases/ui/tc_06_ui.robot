*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot
Library     DataDriver    ${CURDIR}/../../resources/testdata/quotation_rules.csv

Suite Setup       Open Fastwork Site    ${UI_SETTINGS['base_url']}
Suite Teardown    Close Browser Session

*** Test Cases ***
TC_UI_06_Buyer_Accepts_Quotation_And_Redirected_To_Round_One_Payment
    [Documentation]    Buyer accepts quotation, status changes to Accepted, and system redirects to Round 1 payment page
    [Tags]    ui    regression    quotation    payment    round1
    login_features.Login With Email And Password    ${USER_EMAIL}    ${USER_PASSWORD}
    freelancer_chat_features.Open Chat Inbox From Home
    freelancer_chat_features.Open Chat Thread For Freelancer And Product    ${FREELANCER_NAME}    ${PRODUCT_NAME}
    quotation_features.Approve Quotation And Redirect To Round One Payment