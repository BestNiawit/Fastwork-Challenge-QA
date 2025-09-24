*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Verify Landing Page Shows Header_Menus_And_Search
    [Documentation]    Verify logo, menus, and search bar are visible and usable; search returns results.
    [Arguments]    ${keyword}
    home_page.Close Popup And Cookie If Present
    home_page.Scroll Page And Verify Sticky Menu
    home_page.Click Chat Menu
    home_page.Click Jobs Menu
    home_page.Click Profile Menu
    home_page.Search For Keyword    ${keyword}