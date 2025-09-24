*** Settings ***
Documentation    Common helper keywords that keep the mock API workflow lightweight until real integrations are wired in.
Library    BuiltIn
Library    Collections
Library    JSONLibrary

*** Keywords ***
Create API Session
    [Documentation]    Create HTTP session using BASE_URL from settings
    RequestsLibrary.Create Session    api    ${BASE_URL}

Build Authorization Header From Token
    [Documentation]    Build Authorization header and Content-Type application/json
    [Arguments]    ${token}
    ${headers}=    BuiltIn.Create Dictionary    Authorization=Bearer ${token}    Content-Type=application/json
    [Return]    ${headers}

Post JSON And Return Response
    [Documentation]    Send POST request to the given path with JSON body and headers
    [Arguments]    ${path}    ${headers}    ${body}
    ${resp}=    RequestsLibrary.POST    api    ${path}    json=${body}    headers=${headers}
    [Return]    ${resp}

Verify Response Status Code Should Be
    [Documentation]    Verify HTTP status code equals expected
    [Arguments]    ${resp}    ${expected_code}
    BuiltIn.Should Be Equal As Integers    ${resp.status_code}    ${expected_code}

Verify Response JSON Field Should Equal
    [Documentation]    Verify JSON field equals expected value (flat key only)
    [Arguments]    ${resp}    ${key}    ${expected}
    ${json}=    BuiltIn.Evaluate    __import__('json').loads(${resp.text})
    BuiltIn.Should Be Equal    ${json["${key}"]}    ${expected}

Save Response JSON Field Into Test Variable If Present
    [Documentation]    Save JSON field into ${var_name} if the field exists
    [Arguments]    ${resp}    ${key}    ${var_name}
    ${json}=    BuiltIn.Evaluate    __import__('json').loads(${resp.text})
    ${exists}=  BuiltIn.Run Keyword And Return Status    BuiltIn.Set Variable    ${json["${key}"]}
    BuiltIn.Run Keyword If    ${exists}    BuiltIn.Set Test Variable    ${${var_name}}    ${json["${key}"]}

Build Json Headers
    [Documentation]    Return JSON header
    ${headers}=    BuiltIn.Create Dictionary    Content-Type=application/json
    [Return]    ${headers}

Extract JSON From Response
    [Documentation]    Convert response.text to JSON object
    [Arguments]    ${resp}
    ${json}=    BuiltIn.Evaluate    __import__('json').loads(${resp.text})
    [Return]    ${json}

Verify Response JSON Field Should Contain
    [Documentation]    Verify JSON contains field with expected value
    [Arguments]    ${resp}    ${key}    ${expected}
    ${json}=    BuiltIn.Evaluate    __import__('json').loads(${resp.text})
    BuiltIn.Should Contain    ${json["${key}"]}    ${expected}