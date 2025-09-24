*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

*** Test Cases ***
TC_API_06_Invalid_Card_Number
    [Documentation]    Verify payment fails with invalid credit card number.
    [Tags]    api    regression    payment    card

    ${token}=    login_api_features.Login And Get Auth Token
    ...    ${TC_API_06_InvalidCard['username']}
    ...    ${TC_API_06_InvalidCard['password']}

    payment_api_features.Send Payment And Verify Invalid Card Number
    ...    ${token}
    ...    ${TC_API_06_InvalidCard['credit_card_number']}
    ...    ${TC_API_06_InvalidCard['owner']}
    ...    ${TC_API_06_InvalidCard['exp']}
    ...    ${TC_API_06_InvalidCard['cvv']}
    ...    ${TC_API_06_InvalidCard['amount']}
    ...    ${TC_API_06_InvalidCard['currency']}