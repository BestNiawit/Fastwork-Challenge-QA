*** Settings ***
Documentation    Common UI helpers for the Fastwork mock space using the Browser library.
Library    BuiltIn
Library    Collections
Library    Browser

*** Keywords ***
Open Fastwork landing page
    [Arguments]    ${browser}=chromium    ${headless}=${False}
    ${base_url}    Collections.Get From Dictionary    ${UI_SETTINGS}    base_url
    ${viewport}    Collections.Get From Dictionary    ${UI_SETTINGS}    default_viewport
    Browser.New Browser    browser=${browser}    headless=${headless}
    Browser.New Context    viewport=${viewport}
    Browser.New Page    url=${base_url}

Close Fastwork browser
    Browser.Close Browser

Get UI base url
    ${base_url}    Collections.Get From Dictionary    ${UI_SETTINGS}    base_url
    RETURN    ${base_url}

Get default viewport
    ${viewport}    Collections.Get From Dictionary    ${UI_SETTINGS}    default_viewport
    RETURN    ${viewport}

Get dashboard tiles
    ${fixtures}    Collections.Get From Dictionary    ${UI_FIXTURES}    dashboard_tiles
    RETURN    ${fixtures}

Get Fastwork selector
    [Arguments]    ${selector_name}
    ${selector}    Collections.Get From Dictionary    ${UI_SELECTORS}    ${selector_name}
    RETURN    ${selector}

Get Fastwork fixture
    [Arguments]    ${fixture_name}
    ${fixture}    Collections.Get From Dictionary    ${UI_FIXTURES}    ${fixture_name}
    RETURN    ${fixture}
