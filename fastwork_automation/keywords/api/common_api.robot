*** Settings ***
Documentation    Common helper keywords that keep the mock API workflow lightweight until real integrations are wired in.
Library    BuiltIn
Library    Collections
Library    JSONLibrary

*** Keywords ***
Build default headers
    [Arguments]    ${access_token}=${EMPTY}    &{overrides}
    ${headers}    Collections.Create Dictionary
    FOR    ${key}    ${value}    IN    &{DEFAULT_HEADERS}
        Collections.Set To Dictionary    ${headers}    ${key}=${value}
    END
    FOR    ${key}    ${value}    IN    &{overrides}
        Collections.Set To Dictionary    ${headers}    ${key}=${value}
    END
    IF    "${access_token}" != ""
        Collections.Set To Dictionary    ${headers}    Authorization=Bearer ${access_token}
    END
    RETURN    ${headers}

Resolve service route
    [Arguments]    ${group}    ${name}
    ${group_routes}    Collections.Get From Dictionary    ${SERVICE_ROUTES}    ${group}
    ${route}    Collections.Get From Dictionary    ${group_routes}    ${name}
    RETURN    ${route}

Get account fixture
    [Arguments]    ${fixture_name}
    ${fixture}    Collections.Get From Dictionary    ${ACCOUNT_FIXTURES}    ${fixture_name}
    RETURN    ${fixture}

Mock successful response
    [Arguments]    ${payload}    ${status_code}=200
    ${response}    Collections.Create Dictionary    status=success    status_code=${status_code}    data=${payload}
    RETURN    ${response}

Mock error response
    [Arguments]    ${message}    ${status_code}=400
    ${response}    Collections.Create Dictionary    status=error    status_code=${status_code}    message=${message}
    RETURN    ${response}

Validate response matches expectation
    [Arguments]    ${response}    ${expected}
    BuiltIn.Should Be Equal    ${response}    ${expected}
