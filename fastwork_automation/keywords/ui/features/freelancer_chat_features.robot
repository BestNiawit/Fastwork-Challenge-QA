*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Open fastwork chat with freelancer
    [Arguments]    ${product_name}    ${freelancer_name}
    freelancer_chat_page.Click chat freelancer
    freelancer_chat_page.Verify chat is displayed

Create fastwork milestone quotation
    [Arguments]    ${rounds_data}    ${submit}=${True}
    Open fastwork quotation form
    ${round_count}    Collections.Get From Dictionary    ${rounds_data}    total_rounds
    ${amounts}    Collections.Get From Dictionary    ${rounds_data}    amounts
    ${has_dates}    BuiltIn.Run Keyword And Return Status    Collections.Dictionary Should Contain Key    ${rounds_data}    dates
    IF    ${has_dates}
        ${dates}    Collections.Get From Dictionary    ${rounds_data}    dates
    END
    ${title_selector}    common_ui.Get Fastwork selector    round_title_input
    ${desc_selector}    common_ui.Get Fastwork selector    round_description_input
    ${deliver_selector}    common_ui.Get Fastwork selector    round_deliverable_input
    ${amount_selector}    common_ui.Get Fastwork selector    round_amount_input
    ${date_selector}    common_ui.Get Fastwork selector    round_date_input
    ${add_round_selector}    common_ui.Get Fastwork selector    add_round_button
    FOR    ${index}    IN RANGE    ${round_count}
        ${round_number}    Evaluate    ${index} + 1
        Browser.Fill Text    ${title_selector}    Proposal Round ${round_number}
        Browser.Fill Text    ${desc_selector}    Automated description for round ${round_number}
        Browser.Fill Text    ${deliver_selector}    Deliverables for round ${round_number}
        ${amount}    Collections.Get From List    ${amounts}    ${index}
        Browser.Fill Text    ${amount_selector}    ${amount}
        IF    ${has_dates}
            ${date_value}    Collections.Get From List    ${dates}    ${index}
        ELSE
            ${date_value}    BuiltIn.Set Variable    2025-12-0${round_number}
        END
        Browser.Fill Text    ${date_selector}    ${date_value}
        IF    ${round_number} < ${round_count}
            Browser.Click    ${add_round_selector}
        END
    END
    IF    ${submit}
        Submit fastwork quotation form
    END