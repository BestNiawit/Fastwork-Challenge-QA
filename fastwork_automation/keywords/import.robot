*** Settings ***
# Core libraries reused across suites.
Library    BuiltIn
Library    Collections
Library    JSONLibrary
Library    RequestsLibrary
Library    Browser
Library    String

# Environment-scoped configuration and data.
Variables    ${CURDIR}/../resources/settings/${ENV}/api/setting.yaml
Variables    ${CURDIR}/../resources/settings/${ENV}/ui/setting.yaml
Variables    ${CURDIR}/../resources/testdata/${ENV}/api/test_data.yaml

# Locator
Resource    ${CURDIR}/../keywords/ui/locator/freelancer_chat_page_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/home_page_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/login_page_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/milestone_quotation_page_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/milestone_round_page_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/payment_page_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/quotation_view_page_locator.robot

# common 
Resource    ${CURDIR}/../keywords/ui/common_ui.robot
Resource    ${CURDIR}/../keywords/api/common_api.robot

# API keywords.
Resource    ${CURDIR}/../keywords/api/common_api.robot
Resource    ${CURDIR}/../keywords/api/features/login_api_features.robot
Resource    ${CURDIR}/../keywords/api/features/payment_api_features.robot

# UI features keywords.
Resource    ${CURDIR}/../keywords/ui/common_ui.robot
Resource    ${CURDIR}/../keywords/ui/features/home_features.robot
Resource    ${CURDIR}/../keywords/ui/features/login_features.robot
Resource    ${CURDIR}/../keywords/ui/features/dashboard_ui_feature.robot
Resource    ${CURDIR}/../keywords/ui/features/fastwork_site_ui_feature.robot

# page keyword
Resource    ${CURDIR}/../keywords/ui/page/freelancer_chat_page.robot
Resource    ${CURDIR}/../keywords/ui/page/home_page.robot
Resource    ${CURDIR}/../keywords/ui/page/login_page.robot
Resource    ${CURDIR}/../keywords/ui/page/milestone_quotation_page.robot
Resource    ${CURDIR}/../keywords/ui/page/milestone_round_page.robot
Resource    ${CURDIR}/../keywords/ui/page/payment_page.robot
Resource    ${CURDIR}/../keywords/ui/page/quotation_view_page.robot

# test data
Variables    ${CURDIR}/../../fastwork_automation/resources/testdata/${ENV}/ui/test_data.yaml

*** Variables ***
${ENV}    uat
