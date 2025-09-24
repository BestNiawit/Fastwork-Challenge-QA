*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Open Fastwork Landing Page
    [Documentation]    Open Fastwork landing page
    Browser.New Page    ${BASE_URL}
    Browser.Wait For Elements State    ${HOME_PAGE.LOGO}    visible    10s

Close Popup And Cookie If Present
    [Documentation]    Close popup and cookie banner if visible
    Run Keyword And Ignore Error    Browser.Click    ${HOME_PAGE.POPUP}
    Run Keyword And Ignore Error    Browser.Click    ${HOME_PAGE.COOKIE_BANNER}

Scroll Page And Verify Sticky Menu
    [Documentation]    Scroll up and down to verify top menu remains visible
    Browser.Scroll By    0    1000
    Browser.Scroll By    0    -1000
    Browser.Wait For Elements State    ${HOME_PAGE.MENU_CHAT}    visible    5s

Click Chat Menu
    [Documentation]    Click Chat menu button
    Browser.Click    ${HOME_PAGE.MENU_CHAT}

Click Jobs Menu
    [Documentation]    Click Jobs menu button
    Browser.Click    ${HOME_PAGE.MENU_JOBS}

Click Profile Menu
    [Documentation]    Click Profile menu button
    Browser.Click    ${HOME_PAGE.MENU_PROFILE}

Search For Keyword
    [Documentation]    Input keyword into search bar and press Enter
    [Arguments]    ${keyword}
    Browser.Fill Text    ${HOME_PAGE.SEARCH_BAR}    ${keyword}
    Browser.Press Keys   ${HOME_PAGE.SEARCH_BAR}    Enter