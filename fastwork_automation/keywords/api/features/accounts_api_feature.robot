*** Settings ***
Documentation    Feature-level keywords that exercise the mocked account service contract.
Resource    ${CURDIR}/../../import.robot
Library    Collections

*** Keywords ***
Mock account list returns expected dataset
    [Arguments]    ${fixture}=default_list
    ${fixture_data}    common_api.Get account fixture    ${fixture}
    ${expected}    Collections.Get From Dictionary    ${fixture_data}    expected
    ${payload}    Collections.Get From Dictionary    ${expected}    data
    ${status_code}    Collections.Get From Dictionary    ${expected}    status_code
    ${response}    common_api.Mock successful response    ${payload}    ${status_code}
    common_api.Validate response matches expectation    ${response}    ${expected}
    RETURN    ${response}

Mock account list unauthorised error
    [Arguments]    ${fixture}=missing_auth
    ${fixture_data}    common_api.Get account fixture    ${fixture}
    ${expected}    Collections.Get From Dictionary    ${fixture_data}    expected_error
    ${message}    Collections.Get From Dictionary    ${expected}    message
    ${status_code}    Collections.Get From Dictionary    ${expected}    status_code
    ${response}    common_api.Mock error response    ${message}    ${status_code}
    common_api.Validate response matches expectation    ${response}    ${expected}
    RETURN    ${response}
