*** Settings ***
Resource    ${CURDIR}/../../import.robot

*** Keywords ***
Send THB Payment And Verify Success
    [Documentation]    Send THB payment and verify HTTP 200 with status SUCCESS; record transactionId if present
    [Arguments]    ${token}    ${card_number}    ${owner}    ${exp}    ${cvv}    ${amount}    ${currency}
    common_api.Create API Session
    ${headers}=    common_api.Build Authorization Header From Token    ${token}
    ${body}=    BuiltIn.Create Dictionary
    ...    credit_card_number=${card_number}
    ...    credit_card_owner_name=${owner}
    ...    expiration_date=${exp}
    ...    cvv=${cvv}
    ...    amount=${amount}
    ...    currency=${currency}
    ${resp}=    common_api.Post JSON And Return Response    ${PAYMENT_API}    ${headers}    ${body}
    common_api.Verify Response Status Code Should Be    ${resp}    ${expected_code['code_200']}
    common_api.Verify Response JSON Field Should Equal  ${resp}    status    SUCCESS
    common_api.Save Response JSON Field Into Test Variable If Present    ${resp}    transactionId    TRANSACTION_ID

Send Payment And Verify Invalid Format Error
    [Documentation]    Send invalid payment request and expect HTTP 400 with error INVALID_FORMAT or BAD_REQUEST
    [Arguments]    ${token}    ${body}
    common_api.Create API Session
    ${headers}=    common_api.Build Authorization Header From Token    ${token}
    ${resp}=    common_api.Post JSON And Return Response    ${PAYMENT_API}    ${headers}    ${body}
    common_api.Verify Response Status Code Should Be    ${resp}    ${expected_code['code_400']}
    ${json}=    common_api.Extract JSON From Response    ${resp}
    BuiltIn.Should Contain Any    ${json['error']}    INVALID_FORMAT    BAD_REQUEST

Send Payment With Given Amount And Verify Status Code
    [Documentation]    Send payment with given amount and verify expected HTTP status code (e.g., 0.01 -> 200, 0.009 -> 400)
    [Arguments]    ${token}    ${card_number}    ${owner}    ${exp}    ${cvv}    ${amount}    ${currency}    ${expected_code}
    common_api.Create API Session
    ${headers}=    common_api.Build Authorization Header From Token    ${token}
    ${body}=    BuiltIn.Create Dictionary
    ...    credit_card_number=${card_number}
    ...    credit_card_owner_name=${owner}
    ...    expiration_date=${exp}
    ...    cvv=${cvv}
    ...    amount=${amount}
    ...    currency=${currency}
    ${resp}=    common_api.Post JSON And Return Response    ${PAYMENT_API}    ${headers}    ${body}
    common_api.Verify Response Status Code Should Be    ${resp}    ${expected_code}