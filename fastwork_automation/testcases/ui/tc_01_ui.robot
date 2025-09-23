*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

Suite Setup       common_ui.Open Fastwork Site    ${UI_SETTINGS['base_url']}
Suite Teardown    common_ui.Close Browser Session

*** Test Cases ***
TC_UI_01_Verify_Landing_Page_Header_Menus_And_Search_Bar
    [Documentation]    Verify that the landing page shows header, menus, and search bar;
    ...                close popup and cookie; verify sticky top menu; verify main menus are clickable;
    ...                then search a keyword and verify that search results are displayed.
    [Tags]    ui    regression    landingpage
    login_features.Login With Email And Password    ${USER_EMAIL}    ${USER_PASSWORD}
    home_features.Verify Landing Page
    home_features.Close Popup And Cookie
    home_features.Verify Sticky Menu
    home_features.Verify Main Menus Are Clickable
    home_features.Search And Verify Results    ${SEARCH_KEYWORD}