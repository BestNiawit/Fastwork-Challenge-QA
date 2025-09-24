# JMeter Load Test Project

## Structure
- testplans/ : .jmx plans grouped (smoke, regression)
- data/      : CSV/JSON test data
- config/    : env configs + global.properties
- results/   : raw .jtl (ignored by git)
- reports/   : HTML reports (ignored by git)
- lib/       : plugin jars if needed
- bin/       : run scripts (local & docker)
- .github/workflows/ : CI workflow
- docker/    : docker-compose for Grafana/InfluxDB

## Usage
- Local:
  ```bash
  bin/run_local.sh testplans/smoke/sample_smoke.jmx
  ```
- Docker:
  ```bash
  bin/run_docker.sh testplans/smoke/sample_smoke.jmx
  ```
