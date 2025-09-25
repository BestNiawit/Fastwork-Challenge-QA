*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

*** Test Cases ***
TC_API_07_Unauthorized_When_Token_Missing
    [Documentation]    Send payment without Authorization header; expect 401.
    [Tags]    api    security    auth    unauthorized
    payment_api_features.Send Payment Without Authorization And Verify Unauthorized
    ...    ${TC_API_07_NoToken['credit_card_number']}
    ...    ${TC_API_07_NoToken['owner']}
    ...    ${TC_API_07_NoToken['exp']}
    ...    ${TC_API_07_NoToken['cvv']}
    ...    ${TC_API_07_NoToken['amount']}
    ...    ${TC_API_07_NoToken['currency']}
    ...    ${TC_API_07_NoToken['expected_code']}
