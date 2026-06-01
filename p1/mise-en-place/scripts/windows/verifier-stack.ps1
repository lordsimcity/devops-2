# Vérification de la stack
$pages = @(
  @{Nom="Portail"; Url="http://localhost:8080/health"},
  @{Nom="pgAdmin"; Url="http://localhost:5050"},
  @{Nom="Odoo"; Url="http://localhost:8069"}
)
Write-Host "Vérification des accès HTTP" -ForegroundColor Cyan
foreach ($page in $pages) {
  try {
    $r = Invoke-WebRequest -Uri $page.Url -UseBasicParsing -TimeoutSec 20
    Write-Host "$($page.Nom) répond : HTTP $($r.StatusCode)" -ForegroundColor Green
  } catch {
    Write-Host "$($page.Nom) ne répond pas encore : $($page.Url)" -ForegroundColor Yellow
  }
}
docker compose ps
