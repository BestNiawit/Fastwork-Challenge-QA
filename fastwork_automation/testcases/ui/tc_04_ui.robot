*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

Suite Setup       common_ui.Open Fastwork Site    ${UI_SETTINGS['base_url']}
Suite Teardown    common_ui.Close Browser Session

*** Test Cases ***
TC_UI_04_Create_New_Chat_And_Milestone_Quotation
    [Documentation]    Login, open chat, and create 3 milestone rounds by referencing milestone_rounds[0], [1], [2].
    [Tags]    ui    regression    chat    quotation
    # Login + Open chat
    login_features.Login With Email And Password
    ...    ${TC_UI_04['user']}
    ...    ${TC_UI_04['password']}
    freelancer_chat_features.Open Chat Inbox From Home
    freelancer_chat_features.Open Chat Thread For Freelancer And Product
    ...    ${TC_UI_04['chat']['freelancer_name']}
    ...    ${TC_UI_04['chat']['product_name']}
    # R1
    milestone_quotation_features.Create Milestone Quotation
    ...    ${TC_UI_04['milestone_rounds'][0]['title']}
    ...    ${TC_UI_04['milestone_rounds'][0]['description']}
    ...    ${TC_UI_04['milestone_rounds'][0]['deliverables']}
    ...    ${TC_UI_04['milestone_rounds'][0]['amount']}
    ...    ${TC_UI_04['milestone_rounds'][0]['date']}

    # R2
    milestone_quotation_features.Create Milestone Quotation
    ...    ${TC_UI_04['milestone_rounds'][1]['title']}
    ...    ${TC_UI_04['milestone_rounds'][1]['description']}
    ...    ${TC_UI_04['milestone_rounds'][1]['deliverables']}
    ...    ${TC_UI_04['milestone_rounds'][1]['amount']}
    ...    ${TC_UI_04['milestone_rounds'][1]['date']}

    # R3
    milestone_quotation_features.Create Milestone Quotation
    ...    ${TC_UI_04['milestone_rounds'][2]['title']}
    ...    ${TC_UI_04['milestone_rounds'][2]['description']}
    ...    ${TC_UI_04['milestone_rounds'][2]['deliverables']}
    ...    ${TC_UI_04['milestone_rounds'][2]['amount']}
    ...    ${TC_UI_04['milestone_rounds'][2]['date']}