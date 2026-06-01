from flask import Flask
import os

app = Flask(__name__)

@app.get("/")
def accueil():
    odoo_url = os.getenv("ODOO_URL", "https://www.odoo.com")
    pgadmin_url = os.getenv("PGADMIN_URL", "https://www.pgadmin.org")
    return f"""<!doctype html>
<html lang="fr"><head><meta charset="utf-8"><title>INF 236</title>
<style>body{{font-family:Arial;margin:0;background:#f3f6fb;color:#14213d}}header{{background:#113b67;color:white;padding:36px}}main{{max-width:850px;margin:35px auto}}.apps{{display:flex;gap:20px}}.card{{flex:1;background:white;padding:25px;border-radius:14px;box-shadow:0 8px 20px #ccd}}a{{background:#1769aa;color:#fff;padding:10px 14px;border-radius:8px;text-decoration:none;display:inline-block}}</style></head>
<body><header><h1>INF 236</h1><p>Portail d'accès aux applications internes</p></header>
<main><h2>Applications disponibles</h2><div class="apps">
<section class="card"><h3>Odoo</h3><p>Application de gestion intégrée.</p><a href="{odoo_url}" target="_blank">Ouvrir Odoo</a></section>
<section class="card"><h3>pgAdmin</h3><p>Administration de PostgreSQL.</p><a href="{pgadmin_url}" target="_blank">Ouvrir pgAdmin</a></section>
</div><p>Vérification technique : <a href="/health">/health</a></p></main></body></html>"""

@app.get("/health")
def health():
    return {"application": "flask-portal", "status": "ok"}, 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=False)
