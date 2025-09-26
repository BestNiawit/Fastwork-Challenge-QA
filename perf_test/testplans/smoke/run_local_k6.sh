#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
K6_BIN="${K6_BIN:-k6}"
TEST_FILE="${1:-${SCRIPT_DIR}/test_k6.js}"
SUMMARY_DIR="${ROOT_DIR}/report"
SUMMARY_FILE="${SUMMARY_DIR}/test_k6_summary.json"

if ! command -v "${K6_BIN}" >/dev/null 2>&1; then
  echo "Error: k6 executable not found. Install k6 or set K6_BIN." >&2
  exit 1
fi

mkdir -p "${SUMMARY_DIR}"

echo "Running k6 script: ${TEST_FILE}"
"${K6_BIN}" run --summary-export "${SUMMARY_FILE}" "${TEST_FILE}"

echo "Summary saved to ${SUMMARY_FILE}"
