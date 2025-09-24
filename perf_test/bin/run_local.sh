#!/usr/bin/env bash
set -euo pipefail
PLAN="${1:-testplans/smoke/sample_smoke.jmx}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${ROOT}/results"
REP_DIR="${ROOT}/reports"

mkdir -p "$OUT_DIR" "$REP_DIR"

JMETER_BIN="${JMETER_BIN:-jmeter}"
RESULTS_FILE="${OUT_DIR}/results.jtl"

$JMETER_BIN -n -t "$PLAN" \
  -q "${ROOT}/config/global.properties" \
  -q "${ROOT}/config/env/dev.properties" \
  -l "$RESULTS_FILE" \
  -e -o "$REP_DIR"

echo "Raw results: $RESULTS_FILE"
echo "HTML report: $REP_DIR/index.html"
