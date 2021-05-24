# soda-scripting

## Analyze and Scan all tables in the database

This script will automate analyzing and scanning all tables in a database. This can be triggered via jenkins or any other orchestrator. The idea is to get up and running quickly with a few basic tests.

Triggger by calling:

```
sh ../analyze-scan-all-tables.sh
```

## Run a scan based on a date partition
This script will run scans for each date between a start date and an enddate for each data in that range a scan will be triggered with a filter that will on that date. Then the result is sent to Soda Cloud in a way that it looks like the scan was executed on that day.
