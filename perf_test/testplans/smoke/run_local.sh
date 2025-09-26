#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
RUNNER="${ROOT_DIR}/bin/run_local.sh"
DEFAULT_PLAN="testplans/smoke/fast work web.jmx"

if [[ ! -x "${RUNNER}" ]]; then
  echo "Error: ${RUNNER} not found or not executable." >&2
  exit 1
fi

PLAN="${1:-${DEFAULT_PLAN}}"

echo "Running JMeter plan: ${PLAN}"
"${RUNNER}" "${PLAN}"
