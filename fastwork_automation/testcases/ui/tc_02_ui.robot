*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

Suite Setup       common_ui.Open Fastwork Site    ${UI_SETTINGS['base_url']}
Suite Teardown    common_ui.Close Browser Session

*** Test Cases ***
TC_UI_02_Redirect_To_Existing_Chat_When_Order_Is_Incomplete
    [Documentation]    Verify redirect to existing chat when buyer already has an incomplete order with same freelancer & product, and ensure no duplicate chat is created.
    [Tags]    ui    regression    chat    redirect

    login_features.Login With Email And Password    ${USER_EMAIL}    ${USER_PASSWORD}

    freelancer_chat_features.Open Chat Inbox From Home
    freelancer_chat_features.Save Current Chat Thread Count
    ${before}=    Set Variable    ${CHAT_THREAD_COUNT}

    freelancer_chat_features.Open Chat Thread For Freelancer And Product    ${FREELANCER_NAME}    ${PRODUCT_NAME}

    freelancer_chat_features.Return To Chat Inbox
    freelancer_chat_features.Save Current Chat Thread Count
    ${after}=    Set Variable    ${CHAT_THREAD_COUNT}

    BuiltIn.Should Be Equal As Integers    ${after}    ${before}