#!/usr/bin/env bash
# Vérification de la stack
set -u
echo "Vérification des accès HTTP"
for pair in "Portail|http://localhost:8080/health" "pgAdmin|http://localhost:5050" "Odoo|http://localhost:8069"; do
  nom="${pair%%|*}"; url="${pair#*|}"
  if curl --fail --silent --max-time 20 "$url" >/dev/null; then
    echo "$nom répond : $url"
  else
    echo "$nom ne répond pas encore : $url"
  fi
done
docker compose ps
