*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

Suite Setup       common_ui.Open Fastwork Site    ${UI_SETTINGS['base_url']}
Suite Teardown    common_ui.Close Browser Session

*** Test Cases ***
TC_UI_03_Create_New_Chat_When_No_Prior_Chat_Or_Prior_Order_Completed
    [Documentation]    Verify that when buyer has no prior chat or previous order is completed, system creates a new chat thread with no previous messages and thread count increases by one.
    [Tags]    ui    regression    chat    creation

    login_features.Login With Email And Password    ${USER_EMAIL}    ${USER_PASSWORD}

    freelancer_chat_features.Open Chat Inbox From Home
    freelancer_chat_features.Save Current Chat Thread Count
    ${before}=    Set Variable    ${CHAT_THREAD_COUNT}

    freelancer_chat_features.Create New Chat Thread Without Previous Messages
    freelancer_chat_features.Return To Chat Inbox

    freelancer_chat_features.Save Current Chat Thread Count
    ${after}=    Set Variable    ${CHAT_THREAD_COUNT}
    BuiltIn.Should Be Equal As Integers    ${after}    ${before + 1}