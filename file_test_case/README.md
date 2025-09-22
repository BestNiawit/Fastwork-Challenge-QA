# Fastwork Challenge QA Test Cases

Primary resources:
- `./Test case fastwork.pdf` – PDF snapshot of the documented UI and API scenarios.
- Google Sheets tracker: [Create Quotation & Payment Flow](https://docs.google.com/spreadsheets/d/1ljCbdapNY2kIB0OVsBdS7Fy88L0fROL_tJQXAc09RGk/edit?usp=sharing).

The suite covers milestone quotation creation, buyer payment flows, round progression, and `/api/v1/payments` service validation, including positive paths, field-level validation, boundary cases, and platform operating rules (currency support, blackout window, account status).

## Coverage Overview
### UI Milestone Quotation & Payment Flow
- Entry points: landing page navigation, existing chat redirect, and quotation creation from freelancer chat.
- Quotation creation: positive path for three valid milestone rounds plus validations for minimum/maximum rounds, per-round amount (>100 THB), total amount (≥3000 THB), date constraints, and mandatory field lengths.
- Optional fields: verifies that revision notes and remarks remain optional when other inputs are valid.
- Buyer actions: accepting quotations, progressing through payment, starting subsequent rounds, approving deliverables, and terminating jobs mid-plan.
- Payment window rules: covers successful THB payments, service blackout window (23:55–00:15), supported currency list, and handling of inactive account states.

### API Payment Endpoint Suite
- Success path for `/api/v1/payments` with valid payload and active accounts.
- Error handling for missing or malformed fields, unauthorized access, insufficient funds, internal server errors, and inactive party status.
- Boundary and rule-based scenarios for minimum amount acceptance, currency restrictions (THB/VND/IDR only), service blackout window, and cardholder name length.

## How to Use
- Browse the Google Sheet for the latest editable matrix and status tracking.
- Refer to `./Test case fastwork.pdf` when offline or when sharing a fixed snapshot of the documented cases.
