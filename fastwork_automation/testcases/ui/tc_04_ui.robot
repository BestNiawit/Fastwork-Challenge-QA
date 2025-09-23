*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

Suite Setup       common_ui.Open Fastwork Site    ${UI_SETTINGS['base_url']}
Suite Teardown    common_ui.Close Browser Session

*** Test Cases ***
TC_UI_04_Freelancer_Creates_Milestone_Quotation_With_Three_Rounds
    [Documentation]    Verify freelancer can create milestone quotation with 3 valid rounds
    [Tags]    ui    regression    quotation    milestone
    login_features.Login With Email And Password    ${USER_EMAIL}    ${USER_PASSWORD}
    freelancer_chat_features.Open Chat Inbox From Home
    freelancer_chat_features.Open Chat Thread For Freelancer And Product    ${FREELANCER_NAME}    ${PRODUCT_NAME}
    # R1
    milestone_quotation_features.Create Milestone Quotation    ${title}    ${description}    ${deliverables}    ${amount}    ${date}
    # R2
    milestone_quotation_features.Create Milestone Quotation    ${title}    ${description}    ${deliverables}    ${amount}    ${date}
    # R3
    milestone_quotation_features.Create Milestone Quotation    ${title}    ${description}    ${deliverables}    ${amount}    ${date}
