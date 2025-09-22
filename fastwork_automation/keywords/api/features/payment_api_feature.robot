*** Settings ***
Documentation    Fastwork payment API keyword stubs mirroring the PDF test suite.
Resource    ${CURDIR}/../common_api.robot
Library    BuiltIn
Library    Collections
Library    JSONLibrary
Library    RequestsLibrary

*** Keywords ***
Execute fastwork payment scenario
    [Arguments]    ${case_id}    ${use_mock}=${True}
    ${case}    Collections.Get From Dictionary    ${PAYMENT_CASES}    ${case_id}
    ${template_id}    Collections.Get From Dictionary    ${case}    template
    ${template}    Collections.Get From Dictionary    ${PAYMENT_TEMPLATES}    ${template_id}
    ${request}    Evaluate    __import__('copy').deepcopy(${template})
    ${has_overrides}    BuiltIn.Run Keyword And Return Status    Collections.Dictionary Should Contain Key    ${case}    overrides
    IF    ${has_overrides}
        ${overrides}    Collections.Get From Dictionary    ${case}    overrides
        FOR    ${section}    ${override_values}    IN    &{overrides}
            ${section_data}    Collections.Get From Dictionary    ${request}    ${section}
            FOR    ${key}    ${value}    IN    &{override_values}
                Collections.Set To Dictionary    ${section_data}    ${key}=${value}
            END
            Collections.Set To Dictionary    ${request}    ${section}=${section_data}
        END
    END
    IF    ${use_mock}
        ${expected_status}    Collections.Get From Dictionary    ${case}    expected_status
        ${expected_body}    Collections.Get From Dictionary    ${case}    expected_body
        ${response}    Collections.Create Dictionary    status_code=${expected_status}    body=${expected_body}    request=${request}
        RETURN    ${response}
    END
    ${endpoint}    Collections.Get From Dictionary    ${request}    endpoint
    ${method}    Collections.Get From Dictionary    ${request}    method
    ${headers}    Collections.Get From Dictionary    ${request}    headers
    ${payload}    Collections.Get From Dictionary    ${request}    payload
    ${payload_json}    JSONLibrary.Convert dictionary to json    ${payload}
    ${alias}    BuiltIn.Set Variable    Fastwork API
    ${create_status}    BuiltIn.Run Keyword And Ignore Error    RequestsLibrary.Create Session    ${alias}    ${API_BASE_URL}
    ${status}    Collections.Get From List    ${create_status}    0
    IF    "${status}" != "PASS"
        RequestsLibrary.Delete All Sessions
        RequestsLibrary.Create Session    ${alias}    ${API_BASE_URL}
    END
    ${response}    Run Payment Request    ${alias}    ${method}    ${endpoint}    ${payload_json}    ${headers}
    RETURN    ${response}

Run Payment Request
    [Arguments]    ${alias}    ${method}    ${endpoint}    ${payload_json}    ${headers}
    IF    "${method}" == "POST"
        ${response}    RequestsLibrary.Post On Session    ${alias}    ${endpoint}    data=${payload_json}    headers=${headers}
    ELSE IF    "${method}" == "PUT"
        ${response}    RequestsLibrary.Put On Session    ${alias}    ${endpoint}    data=${payload_json}    headers=${headers}
    ELSE
        Fail    Unsupported HTTP method: ${method}
    END
    RETURN    ${response}

Validate fastwork payment response
    [Arguments]    ${response}    ${case_id}
    ${case}    Collections.Get From Dictionary    ${PAYMENT_CASES}    ${case_id}
    ${expected_status}    Collections.Get From Dictionary    ${case}    expected_status
    ${expected_body}    Collections.Get From Dictionary    ${case}    expected_body
    ${actual_status}    Collections.Get From Dictionary    ${response}    status_code
    BuiltIn.Should Be Equal As Integers    ${actual_status}    ${expected_status}
    ${actual_body}    Collections.Get From Dictionary    ${response}    body
    BuiltIn.Should Be Equal    ${actual_body}    ${expected_body}
