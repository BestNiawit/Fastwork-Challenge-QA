*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Open Chat Inbox From Home
    [Documentation]    From Home page, click Chat menu to open the chat inbox
    home_page.Verify Top Menu Should Be Displayed
    home_page.Click Chat Menu
    freelancer_chat_page.Verify Chat Inbox Should Be Displayed

Save Current Chat Thread Count
    [Documentation]    Save current chat thread count into ${CHAT_THREAD_COUNT}
    freelancer_chat_page.Save Current Chat Thread Count Into Test Variable

Open Chat Thread For Freelancer And Product
    [Documentation]    Open existing chat thread for the given freelancer and product
    [Arguments]    ${freelancer_name}    ${product_name}
    freelancer_chat_page.Open Existing Chat Thread By Freelancer And Product    ${freelancer_name}    ${product_name}
    freelancer_chat_page.Verify Chat History Should Be Displayed

Return To Chat Inbox
    [Documentation]    Return to chat inbox after viewing a chat room
    Browser.Go Back
    freelancer_chat_page.Verify Chat Inbox Should Be Displayed

Create New Chat Thread Without Previous Messages
    [Documentation]    Create a new chat thread and verify that it has no previous messages
    freelancer_chat_page.Click New Chat Button To Start A New Thread
    freelancer_chat_page.Verify Chat Room Should Be Opened
    freelancer_chat_page.Verify Chat Room Should Have No Previous Messages