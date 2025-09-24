*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

*** Test Cases ***
TC_API_01_Successful_Payment_With_THB
    [Documentation]    Login with credentials from YAML, obtain token, send THB payment with valid data, then verify HTTP 200 and response status SUCCESS. Record transactionId if present.
    [Tags]    api    regression    payment    thb
    ${token}=    login_api_features.Login And Get Auth Token
    ...    ${TC_API_01['username']}
    ...    ${TC_API_01['password']}
    payment_api_features.Send THB Payment And Verify Success
    ...    ${token}
    ...    ${TC_API_01['card_number']}
    ...    ${TC_API_01['owner']}
    ...    ${TC_API_01['exp']}
    ...    ${TC_API_01['cvv']}
    ...    ${TC_API_01['amount']}
    ...    ${TC_API_01['currency']}
