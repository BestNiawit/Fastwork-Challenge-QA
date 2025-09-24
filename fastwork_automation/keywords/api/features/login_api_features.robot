*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Login And Get Auth Token
    [Documentation]    Perform login API call and return token
    [Arguments]    ${username}    ${password}

    common_api.Create API Session
    ${headers}=    common_api.Build Json Headers
    ${body}=    BuiltIn.Create Dictionary    username=${username}    password=${password}
    ${resp}=    common_api.Post JSON And Return Response    ${LOGIN_API}    ${headers}    ${body}
    common_api.Verify Response Status Code Should Be    ${resp}    ${expected_code['code_200']}
    ${json}=    common_api.Extract JSON From Response    ${resp}
    ${token}=   Set Variable    ${json['token']}
    [Return]    ${token}