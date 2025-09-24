*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

*** Test Cases ***
TC_API_04_Currency_Allowlist_VND_Pass_USD_Fail
    [Documentation]    Verify currency allowlist: VND should succeed (200), USD should be rejected (400).
    [Tags]    api    regression    payment    currency

    # --- Dataset 1: VND -> expect 200 ---
    ${token}=    login_api_features.Login And Get Auth Token
    ...    ${TC_API_04_Dataset1['username']}
    ...    ${TC_API_04_Dataset1['password']}

    payment_api_features.Send Payment With Given Amount And Verify Status Code
    ...    ${token}
    ...    ${TC_API_04_Dataset1['credit_card_number']}
    ...    ${TC_API_04_Dataset1['owner']}
    ...    ${TC_API_04_Dataset1['exp']}
    ...    ${TC_API_04_Dataset1['cvv']}
    ...    ${TC_API_04_Dataset1['amount']}
    ...    ${TC_API_04_Dataset1['currency']}
    ...    ${expected_code['code_200']}

    # --- Dataset 2: USD -> expect 400 ---
    ${token}=    auth_features.Login And Get Auth Token
    ...    ${TC_API_04_Dataset2['username']}
    ...    ${TC_API_04_Dataset2['password']}

    payment_api_features.Send Payment With Given Amount And Verify Status Code
    ...    ${token}
    ...    ${TC_API_04_Dataset2['credit_card_number']}
    ...    ${TC_API_04_Dataset2['owner']}
    ...    ${TC_API_04_Dataset2['exp']}
    ...    ${TC_API_04_Dataset2['cvv']}
    ...    ${TC_API_04_Dataset2['amount']}
    ...    ${TC_API_04_Dataset2['currency']}
    ...    ${expected_code['code_400']}