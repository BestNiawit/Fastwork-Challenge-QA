*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Click chat freelancer
    Browser.Click    ${freelancer_chat_page_locator.chat_button_selector}

Verify chat is displayed
    [Arguments]   ${freelancer_name}
    ${freelancer_name}    String.Replace string    string=${freelancer_chat_page_locator.freelancer_name}    search_for=***name***    replace_with=${freelancer_name}
    Browser.Wait For Elements State    ${freelancer_chat_page_locator.chat_thread_selector}    state=visible
    
Click fastwork quotation form
    Browser.Click    ${freelancer_chat_page_locator.quotation_button_selector}

Submit fastwork quotation form
    Browser.Click    ${freelancer_chat_page_locator.submit_selector}

Tap chat freelancer by name
    [Arguments]   ${freelancer_name}
    ${freelancer_name}    String.Replace string    string=${freelancer_chat_page_locator.freelancer_name}    search_for=***name***    replace_with=${freelancer_name}
    Browser.Click    ${freelancer_name}     ${freelancer_name}