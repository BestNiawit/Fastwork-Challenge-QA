*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

*** Test Cases ***
TC_API_05_Service_Closed_Window_2358_Then_0015
    [Documentation]    Verify service closed window 23:55–00:15. At 23:58 payment should be blocked (400). At 00:15 payment should pass (200).
    [Tags]    api    regression    payment    service_window

    # --- Dataset 1: 23:58 -> expect 400 ---
    ${token}=    login_api_features.Login And Get Auth Token
    ...    ${TC_API_05_Dataset1['username']}
    ...    ${TC_API_05_Dataset1['password']}

    payment_api_features.Send Payment With Given Amount And Verify Status Code
    ...    ${token}
    ...    ${TC_API_05_Dataset1['credit_card_number']}
    ...    ${TC_API_05_Dataset1['owner']}
    ...    ${TC_API_05_Dataset1['exp']}
    ...    ${TC_API_05_Dataset1['cvv']}
    ...    ${TC_API_05_Dataset1['amount']}
    ...    ${TC_API_05_Dataset1['currency']}
    ...    ${expected_code['code_400']}

    # --- Dataset 2: 00:15 -> expect 200 ---
    ${token}=    login_api_features.Login And Get Auth Token
    ...    ${TC_API_05_Dataset2['username']}
    ...    ${TC_API_05_Dataset2['password']}

    payment_api_features.Send Payment With Given Amount And Verify Status Code
    ...    ${token}
    ...    ${TC_API_05_Dataset2['credit_card_number']}
    ...    ${TC_API_05_Dataset2['owner']}
    ...    ${TC_API_05_Dataset2['exp']}
    ...    ${TC_API_05_Dataset2['cvv']}
    ...    ${TC_API_05_Dataset2['amount']}
    ...    ${TC_API_05_Dataset2['currency']}
    ...    ${expected_code['code_200']}