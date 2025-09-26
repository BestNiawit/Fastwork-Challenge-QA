# JMeter Load Test Project

## Folder Guide
- `testplans/`: JMeter test plans. Each folder (smoke, regression) holds a plan.
- `data/`: CSV or JSON files used inside the tests.
- `config/`: Environment settings and `global.properties`.
- `results/`: Raw `.jtl` files. Git ignores this folder.
- `reports/`: HTML reports. Git ignores this folder too.
- `lib/`: Extra JMeter plugins if you need them.
- `bin/`: Shell scripts to run the tests on your machine or in Docker.
- `.github/workflows/`: GitHub Actions workflow files.
- `docker/`: Docker Compose files for Grafana and InfluxDB.

## How To Run
- Local machine:
  ```bash
  bin/run_local.sh testplans/smoke/sample_smoke.jmx
  ```
