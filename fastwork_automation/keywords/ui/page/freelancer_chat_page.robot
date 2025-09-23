*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Verify Chat Inbox Should Be Displayed
    [Documentation]    Verify that chat inbox list is visible
    Browser.Wait For Elements State    ${CHAT_PAGE.INBOX_LIST}    visible    timeout=10s

Get Chat Thread Count And Save As
    [Documentation]    Get chat thread count in inbox and save as a test variable
    ${count}=    Browser.Get Element Count    ${CHAT_PAGE.INBOX_ITEM}
    Set Test Variable    ${CHAT_THREAD_COUNT}    ${count}

Open Chat Thread By Freelancer And Product
    [Documentation]    Open existing chat thread by freelancer and product name
    [Arguments]    ${freelancer_name}    ${product_name}
    ${xpath}=    Set Variable    ${mock}
    Browser.Click    ${xpath}

Verify Chat History Should Be Displayed
    [Documentation]    Verify that chat room is opened and history messages are visible
    Browser.Wait For Elements State    ${CHAT_PAGE.ROOM_HEADER}     visible    timeout=10s
    Browser.Wait For Elements State    ${CHAT_PAGE.MESSAGE_ITEM}    visible    timeout=10s

Return To Chat Inbox If Possible
    [Documentation]    Navigate back to chat inbox list if the UI provides a back button
    [Arguments]    ${freelancer_name}    ${product_name}
    Open Chat Thread By Freelancer And Product    ${freelancer_name}    ${product_name}
    Browser.Wait For Elements State    ${CHAT_PAGE.INBOX_LIST}    visible    timeout=10s

Verify Chat Inbox Should Be Displayed
    [Documentation]    Verify that the chat inbox list is displayed
    Browser.Wait For Elements State    ${CHAT_PAGE.INBOX_LIST}    visible    timeout=10s

Save Current Chat Thread Count Into Test Variable
    [Documentation]    Save the current chat thread count into ${CHAT_THREAD_COUNT}
    ${count}=    Browser.Get Element Count    ${CHAT_PAGE.INBOX_ITEM}
    Set Test Variable    ${CHAT_THREAD_COUNT}    ${count}

Open Existing Chat Thread By Freelancer And Product
    [Documentation]    Open an existing chat thread matching freelancer and product
    [Arguments]    ${freelancer_name}    ${product_name}
    ${xpath}=    Set Variable    xpath=//div[@data-testid="chat-item" and .//text()[normalize-space()="${freelancer_name}"] and .//text()[normalize-space()="${product_name}"]]
    Browser.Click    ${xpath}

Verify Chat History Should Be Displayed
    [Documentation]    Verify that chat history is displayed in the opened chat room
    Browser.Wait For Elements State    ${CHAT_PAGE.ROOM_HEADER}     visible    timeout=10s
    Browser.Wait For Elements State    ${CHAT_PAGE.MESSAGE_ITEM}    visible    timeout=10s

Click Back To Chat Inbox If Available
    [Documentation]    Attempt to return to chat inbox, fallback to browser back if no button found
    ${clicked}=    Run Keyword And Return Status    Browser.Click    ${CHAT_PAGE.BACK_TO_INBOX_BY_TESTID}
    IF    '${clicked}' == 'False'
        ${clicked}=    Run Keyword And Return Status    Browser.Click    ${CHAT_PAGE.BACK_TO_INBOX_BY_ARIA}
    END
    IF    '${clicked}' == 'False'
        ${clicked}=    Run Keyword And Return Status    Browser.Click    ${CHAT_PAGE.BACK_TO_INBOX_BY_TEXT}
    END
    IF    '${clicked}' == 'False'
        ${clicked}=    Run Keyword And Return Status    Browser.Click    ${CHAT_PAGE.BACK_TO_INBOX_BY_CLASS}
    END
    IF    '${clicked}' == 'False'
        Browser.Go Back
    END
    Browser.Wait For Elements State    ${CHAT_PAGE.INBOX_LIST}    visible    timeout=10s

Click New Chat Button To Start A New Thread
    [Documentation]    Click the New Chat button to start a new chat thread
    Browser.Click    ${CHAT_PAGE.NEW_CHAT_BUTTON}

Verify Chat Room Should Be Opened
    [Documentation]    Verify that a chat room is opened
    Browser.Wait For Elements State    ${CHAT_PAGE.ROOM_HEADER}    visible    timeout=10s

Verify Chat Room Should Have No Previous Messages
    [Documentation]    Verify that the newly opened chat room has no previous messages
    ${msg_count}=    Browser.Get Element Count    ${CHAT_PAGE.MESSAGE_ITEM}
    BuiltIn.Should Be Equal As Integers    ${msg_count}    0