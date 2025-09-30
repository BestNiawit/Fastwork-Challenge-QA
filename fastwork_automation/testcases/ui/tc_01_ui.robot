*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

*** Test Cases ***
TC_UI_01_Verify_Landing_Page_Shows_Header_Menus_And_Search
    [Documentation]    Verify landing page header, sticky menus, and search bar functionality. Search should navigate to results page.
    [Tags]    ui    regression    landing

    


    home_page.Open Fastwork Landing Page   ${UI_SETTINGS['base_url']}
    home_features.Verify Landing Page Shows Header_Menus_And_Search    design
    common_ui.Close Browser Session