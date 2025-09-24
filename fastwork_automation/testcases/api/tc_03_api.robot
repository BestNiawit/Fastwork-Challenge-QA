*** Settings ***
Resource    ${CURDIR}/../../keywords/import.robot

*** Test Cases ***
TC_API_03_Boundary_Check_Amount_Pass_And_Fail
    [Documentation]    Verify payment amount boundary: 0.01 should succeed with 200, 0.009 should fail with 400.
    [Tags]    api    regression    payment    boundary

    # --- Dataset 1: amount=0.01 → expect 200 ---
    ${token}=    login_api_features.Login And Get Auth Token
    ...    ${TC_API_03_Dataset1['username']}
    ...    ${TC_API_03_Dataset1['password']}

    payment_api_features.Send Payment With Given Amount And Verify Status Code
    ...    ${token}
    ...    ${TC_API_03_Dataset1['credit_card_number']}
    ...    ${TC_API_03_Dataset1['owner']}
    ...    ${TC_API_03_Dataset1['exp']}
    ...    ${TC_API_03_Dataset1['cvv']}
    ...    ${TC_API_03_Dataset1['amount']}
    ...    ${TC_API_03_Dataset1['currency']}
    ...    ${expected_code['code_200']}

    # --- Dataset 2: amount=0.009 → expect 400 ---
    ${token}=    login_api_features.Login And Get Auth Token
    ...    ${TC_API_03_Dataset2['username']}
    ...    ${TC_API_03_Dataset2['password']}

    payment_api_features.Send Payment With Given Amount And Verify Status Code
    ...    ${token}
    ...    ${TC_API_03_Dataset2['credit_card_number']}
    ...    ${TC_API_03_Dataset2['owner']}
    ...    ${TC_API_03_Dataset2['exp']}
    ...    ${TC_API_03_Dataset2['cvv']}
    ...    ${TC_API_03_Dataset2['amount']}
    ...    ${TC_API_03_Dataset2['currency']}
    ...    ${expected_code['code_400']}