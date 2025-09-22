*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot
Suite Teardown    common_ui.Close Fastwork browser

*** Test Cases ***
UI-001 Landing page shows key UI components
    [Tags]    Smoke
    common
/    ssc