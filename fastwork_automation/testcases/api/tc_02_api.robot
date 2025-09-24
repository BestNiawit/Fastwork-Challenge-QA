*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

*** Test Cases ***
TC_API_02_Invalid_Format_Missing_CVV
    ${token}=    login_api_features.Login And Get Auth Token
    ...    ${TC_API_02_Dataset1['username']}
    ...    ${TC_API_02_Dataset1['password']}
    ${body}=    Create Dictionary
    ...    owner=${TC_API_02_Dataset1['owner']}
    ...    exp=${TC_API_02_Dataset1['exp']}
    ...    amount=${TC_API_02_Dataset1['amount']}
    ...    currency=${TC_API_02_Dataset1['currency']}
    payment_api_features.Send Payment And Verify Invalid Format Error    ${token}    ${body}


TC_API_02_Invalid_Format_Bad_Expiration
    ${token}=    login_api_features.Login And Get Auth Token
    ...    ${TC_API_02_Dataset2['username']}
    ...    ${TC_API_02_Dataset2['password']}
    ${body}=    Create Dictionary
    ...    owner=${TC_API_02_Dataset2['owner']}
    ...    exp=${TC_API_02_Dataset2['exp']}
    ...    cvv=${TC_API_02_Dataset2['cvv']}
    ...    amount=${TC_API_02_Dataset2['amount']}
    ...    currency=${TC_API_02_Dataset2['currency']}
    payment_api_features.Send Payment And Verify Invalid Format Error    ${token}    ${body}