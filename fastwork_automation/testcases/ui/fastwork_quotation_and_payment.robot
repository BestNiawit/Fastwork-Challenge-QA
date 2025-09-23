*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot
Suite Teardown    common_ui.Close Fastwork browser

*** Test Cases ***
UI-001 Landing page shows key UI components
    [Tags]    Smoke
    common_ui.Open Fastwork landing page
    login_page.Click fastwork login modal
    login_features.Input fastwork login form     ${tc_001['username']}   ${tc_001['password']}
    home_features.Validate fastwork landing page should be displayed

UI-002 Chat redirect to previous conversation (same freelancer & product, incomplete order)
    [Tags]    Regression
    common_ui.Open Fastwork landing page
    login_page.Click fastwork login modal
    login_features.Input fastwork login form     ${tc_002['username']}   ${tc_002['password']}
    home_features.Validate fastwork landing page should be displayed
    freelancer_chat_page.Click chat freelancer
    freelancer_chat_page.Verify chat is displayed
    freelancer_chat_page.Tap chat freelancer by name   ${tc_001['freelancer_01']}
    freelancer_chat_page.Tap chat freelancer by name   ${tc_002['freelancer_02']}
    freelancer_chat_page.Verify chat is displayed   ${tc_002['freelancer_02']}
    freelancer_chat_page.Tap chat freelancer by name   ${tc_002['freelancer_01']}
    freelancer_chat_page.Verify chat is displayed   ${tc_001['freelancer_01']}
