# Fastwork Challenge QA Homework Submission

This repository is submitted as the homework deliverable for the Fastwork QA challenge assignment. It consolidates the manual test design and supporting automation assets required by the brief.

## Assignment Scope
- Validate the end-to-end quotation and payment experience across both UI and API touchpoints.
- Document test cases in shareable formats for manual execution and stakeholder review.
- Provide a Robot Framework workspace that demonstrates automation readiness for critical flows.

## Deliverables
- `file_test_case/Test case fastwork.pdf` – offline snapshot of the documented UI and API scenarios.
- Google Sheets test case matrix: [Create Quotation & Payment Flow](https://docs.google.com/spreadsheets/d/1ljCbdapNY2kIB0OVsBdS7Fy88L0fROL_tJQXAc09RGk/edit?usp=sharing).
- `robot_framework/` workspace prepared for automation hand-off.

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

## Robot Framework Workspace
- Automation assets live under `robot_framework/` with environment-specific YAML translations and a single lower-case import bundle (`imports/import.resource`).
- See `robot_framework/README.md` for structure, dependency installation, and execution examples.
- Sample execution command: `robot -d results tests/quotation_payment.robot`.

## How To Use This Submission
- Review the PDF and Google Sheets artifacts to understand the full manual coverage.
- Leverage the Robot Framework suite for quick regression checks on critical user flows.
- Simple perf test
