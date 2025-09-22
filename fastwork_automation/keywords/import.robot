*** Settings ***
# Core libraries reused across suites.
Library    BuiltIn
Library    Collections
Library    JSONLibrary
Library    RequestsLibrary
Library    Browser

# Environment-scoped configuration and data.
Variables    ${CURDIR}/../resources/settings/${ENV}/api/setting.yaml
Variables    ${CURDIR}/../resources/settings/${ENV}/ui/setting.yaml
Variables    ${CURDIR}/../resources/testdata/${ENV}/api/test_data.yaml
Variables    ${CURDIR}/../resources/testdata/${ENV}/ui/test_data.yaml
Variables    ${CURDIR}/../resources/translation/${ENV}/ui/${LANG}.yaml

# Locator
Resource    ${CURDIR}/../keywords/ui/locator/home_page_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/login_page_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/freelancer_chat_page_locator.robot

# API keywords.
Resource    ${CURDIR}/../keywords/api/common_api.robot
Resource    ${CURDIR}/../keywords/api/features/accounts_api_feature.robot
Resource    ${CURDIR}/../keywords/api/features/payment_api_feature.robot

# UI features keywords.
Resource    ${CURDIR}/../keywords/ui/common_ui.robot
Resource    ${CURDIR}/../keywords/ui/features/home_features.robot
Resource    ${CURDIR}/../keywords/ui/features/dashboard_ui_feature.robot
Resource    ${CURDIR}/../keywords/ui/features/fastwork_site_ui_feature.robot

# page keyword
Resource    ${CURDIR}/../keywords/ui/page/home_page.robot
Resource    ${CURDIR}/../keywords/ui/page/login_page.robot
Resource    ${CURDIR}/../keywords/ui/page/freelancer_chat_page.robot

*** Variables ***
${ENV}    dev
${LANG}   en
