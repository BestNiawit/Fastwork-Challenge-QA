*** Settings ***
Documentation    Mocked API suite reflecting the Fastwork payment endpoint scenarios.
Resource    ${CURDIR}/../../keywords/import.robot
Library    Collections

*** Test Cases ***
API-001 Successful payment
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-001
    payment_api_feature.Validate fastwork payment response    ${response}    API-001

API-002 Invalid format missing fields
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-002
    payment_api_feature.Validate fastwork payment response    ${response}    API-002

API-003 Unauthorized request
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-003
    payment_api_feature.Validate fastwork payment response    ${response}    API-003

API-004 Insufficient funds
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-004
    payment_api_feature.Validate fastwork payment response    ${response}    API-004

API-005 Internal server error
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-005
    payment_api_feature.Validate fastwork payment response    ${response}    API-005

API-010 Amount just above minimum
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-010
    payment_api_feature.Validate fastwork payment response    ${response}    API-010

API-011 Amount at minimum threshold
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-011
    payment_api_feature.Validate fastwork payment response    ${response}    API-011

API-012 Amount less than minimum
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-012
    payment_api_feature.Validate fastwork payment response    ${response}    API-012

API-013 Unsupported currency
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-013
    payment_api_feature.Validate fastwork payment response    ${response}    API-013

API-014 Service closed window
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-014
    payment_api_feature.Validate fastwork payment response    ${response}    API-014

API-015 Owner name length validation
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-015
    payment_api_feature.Validate fastwork payment response    ${response}    API-015

API-016 Account status inactive
    ${response}    payment_api_feature.Execute fastwork payment scenario    API-016
    payment_api_feature.Validate fastwork payment response    ${response}    API-016
