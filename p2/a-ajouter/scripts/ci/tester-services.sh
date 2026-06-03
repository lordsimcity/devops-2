#!/usr/bin/env bash
# Test automatisé exécuté depuis le conteneur Jenkins
# Jenkins atteint les ports publiés par Docker via host.docker.internal.

set -eu

HOTE="${HOTE_TEST:-host.docker.internal}"

attendre_url() {
  nom="$1"
  url="$2"
  essais="$3"
  compteur=1

  echo "Vérification de ${nom} : ${url}"
  while [ "$compteur" -le "$essais" ]; do
    if curl --fail --silent --show-error --max-time 10 "$url" >/dev/null; then
      echo "${nom} répond correctement."
      return 0
    fi
    echo "${nom} n'est pas encore disponible (essai ${compteur}/${essais})."
    compteur=$((compteur + 1))
    sleep 3
  done

  echo "${nom} ne répond pas après les vérifications."
  return 1
}

attendre_url "Portail Flask" "http://${HOTE}:8080/health" 15
attendre_url "pgAdmin" "http://${HOTE}:5050" 60
attendre_url "Odoo" "http://${HOTE}:8069/web/login" 30

echo "Tous les tests HTTP du TP sont réussis."
