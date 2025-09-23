*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Verify Landing Page
    [Documentation]    Verify that landing page shows logo, menu, and search bar
    Verify Logo Should Be Displayed
    Verify Top Menu Should Be Displayed

Close Popup And Cookie
    [Documentation]    Close popup and cookie banner if displayed
    Click Popup Close Button
    Click Cookie Accept Button

Verify Sticky Menu
    [Documentation]    Scroll up and down then verify top menu remains visible
    Scroll Down
    Scroll Up
    Verify Top Menu Should Be Displayed

Verify Main Menus Are Clickable
    [Documentation]    Verify Chat, Orders, and Profile menus are clickable
    Click Chat Menu
    Click Orders Menu
    Click Profile Menu

Search And Verify Results
    [Documentation]    Search keyword and verify search results are displayed
    [Arguments]    ${keyword}
    Input Search Keyword    ${keyword}
    Press Enter On Search Bar
    Verify Search Results Should Be Displayed