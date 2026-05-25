#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/check_db.sh
# Runs simple queries inside the running Postgres container
CONTAINER_NAME=$(docker-compose ps -q db)
if [ -z "$CONTAINER_NAME" ]; then
  echo "Postgres container not running. Start with: docker compose up -d"
  exit 1
fi

docker exec -i "$CONTAINER_NAME" psql -U postgres -d company -c "SELECT first_name, last_name, d.name AS department FROM employees e JOIN departments d ON e.department_id = d.id;"
docker exec -i "$CONTAINER_NAME" psql -U postgres -d company -c "SELECT DISTINCT name FROM departments;"
docker exec -i "$CONTAINER_NAME" psql -U postgres -d company -c "SELECT e.first_name, e.last_name FROM employees e JOIN employee_projects ep ON e.id = ep.employee_id JOIN projects p ON ep.project_id = p.id WHERE p.name = 'Website Revamp';"
