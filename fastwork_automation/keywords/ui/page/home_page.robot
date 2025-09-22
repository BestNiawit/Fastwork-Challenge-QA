*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Fastwork should be displayed banner
    Browser.Wait For Elements State    ${home_page_locator.hero_selector}    state=visible

Fastwork should show search results for
    [Arguments]    ${query}
    ${current_url}    Browser.Get Url
    BuiltIn.Should Contain    ${current_url}    ${query}