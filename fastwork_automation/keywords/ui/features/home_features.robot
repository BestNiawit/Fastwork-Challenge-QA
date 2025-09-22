*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Open Fastwork home page
    [Arguments]    ${browser}=chromium    ${headless}=${False}
    common_ui.Open Fastwork landing page    ${browser}    ${headless}
    home_page.Fastwork should be displayed banner

Validate fastwork landing page should be displayed
    [Documentation]   Validate fastwork landing page should be displayed
    ${search_selector}    common_ui.Get Fastwork selector    search_input
    Browser.Wait For Elements State    ${home_page_locator.header_logo}    state=visible
    Browser.Wait For Elements State    ${home_page_locator.global_menu_items}     state=visible
    Browser.Wait For Elements State    ${home_page_locator.search_selector}    state=visible

Search fastwork services
    [Arguments]    ${query}
    Browser.Fill Text    ${home_page_locator.search_input}    ${query}
    Browser.Click    ${home_page_locator.search_submit}

Ensure fastwork language switch visible
    Browser.Wait For Elements State    ${home_page_locator.language_switch}    state=visible
