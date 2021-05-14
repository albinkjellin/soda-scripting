# sh ../analyze-scan-all-tables.sh
soda analyze
for f in tables/*; do soda scan warehouse.yml $f; done
