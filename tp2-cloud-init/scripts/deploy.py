from jinja2 import Environment, FileSystemLoader
import yaml
from pathlib import Path

# Charger le profil Web
with open("profiles/web.yml", "r") as file:
    profile = yaml.safe_load(file)

# Lire la clé publique SSH
ssh_public_key = Path.home().joinpath(".ssh/bd2c_tp2.pub").read_text().strip()

# Définir les données
data = {
    "hostname": "bd2c-web01",
    "username": "etudiant",
    "ssh_public_key": ssh_public_key,
    "packages": profile["packages"]
}

# Charger et générer le template
env = Environment(loader=FileSystemLoader("templates"))
template = env.get_template("user-data.j2")
result = template.render(data)

# Enregistrer le résultat
Path("generated").mkdir(exist_ok=True)
Path("generated/user-data-web").write_text(result)

print("Fichier user-data généré avec succès !")