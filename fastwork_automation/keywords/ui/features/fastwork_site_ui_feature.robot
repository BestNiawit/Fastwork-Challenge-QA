*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Leave fastwork mandatory fields blank
    Open fastwork quotation form
    ${title_selector}    common_ui.Get Fastwork selector    round_title_input
    ${desc_selector}    common_ui.Get Fastwork selector    round_description_input
    ${deliver_selector}    common_ui.Get Fastwork selector    round_deliverable_input
    Browser.Fill Text    ${title_selector}    
    Browser.Fill Text    ${desc_selector}    
    Browser.Fill Text    ${deliver_selector}    
    Submit fastwork quotation form

Leave fastwork optional fields empty
    ${revision_selector}    common_ui.Get Fastwork selector    optional_revision_input
    ${note_selector}    common_ui.Get Fastwork selector    optional_note_input
    Browser.Fill Text    ${revision_selector}    
    Browser.Fill Text    ${note_selector}    

Expect fastwork quotation success
    ${status_badge_selector}    common_ui.Get Fastwork selector    quotation_status_badge
    Browser.Wait For Elements State    ${status_badge_selector}    state=visible
    BuiltIn.Log    Quotation created successfully.

Expect fastwork error message
    [Arguments]    ${expected_text}
    ${error_selector}    common_ui.Get Fastwork selector    error_toast
    Browser.Wait For Elements State    ${error_selector}    state=visible
    ${message}    Browser.Get Text    ${error_selector}
    BuiltIn.Should Contain    ${message}    ${expected_text}

Buyer accepts fastwork quotation
    ${accept_selector}    common_ui.Get Fastwork selector    buyer_accept_button
    Browser.Click    ${accept_selector}

Proceed to fastwork payment
    [Arguments]    ${amount}    ${currency}
    ${payment_amount_selector}    common_ui.Get Fastwork selector    payment_amount_field
    ${currency_selector}    common_ui.Get Fastwork selector    payment_currency_select
    ${submit_selector}    common_ui.Get Fastwork selector    payment_submit_button
    Browser.Fill Text    ${payment_amount_selector}    ${amount}
    Browser.Select Options By    ${currency_selector}    value    ${currency}
    Browser.Click    ${submit_selector}

Expect fastwork payment status
    [Arguments]    ${expected_text}
    ${result_selector}    common_ui.Get Fastwork selector    payment_result_banner
    Browser.Wait For Elements State    ${result_selector}    state=visible
    ${message}    Browser.Get Text    ${result_selector}
    BuiltIn.Should Contain    ${message}    ${expected_text}

Expect fastwork service closed message
    ${closed_selector}    common_ui.Get Fastwork selector    service_closed_message
    Browser.Wait For Elements State    ${closed_selector}    state=visible

Expect fastwork inactive account banner
    ${banner_selector}    common_ui.Get Fastwork selector    inactive_account_banner
    Browser.Wait For Elements State    ${banner_selector}    state=visible

Start next fastwork round
    ${start_selector}    common_ui.Get Fastwork selector    start_next_round_button
    Browser.Click    ${start_selector}

Approve fastwork round work
    ${approve_selector}    common_ui.Get Fastwork selector    approve_round_button
    Browser.Click    ${approve_selector}

Terminate fastwork job
    ${terminate_selector}    common_ui.Get Fastwork selector    terminate_job_button
    ${confirm_selector}    common_ui.Get Fastwork selector    confirmation_modal_confirm
    Browser.Click    ${terminate_selector}
    Browser.Click    ${confirm_selector}
