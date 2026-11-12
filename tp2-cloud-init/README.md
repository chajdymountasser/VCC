# TP2 – Automatisation du déploiement des machines virtuelles avec Cloud-Init

## Présentation

Ce TP a pour objectif de découvrir et de mettre en pratique **Cloud-Init** pour automatiser la configuration et le déploiement de machines virtuelles sous Ubuntu.

Le travail est réalisé dans un environnement de virtualisation basé sur **KVM/QEMU et libvirt**.

## Objectifs

- Découvrir le fonctionnement de Cloud-Init.
- Configurer des machines virtuelles à l'aide de fichiers YAML.
- Utiliser le datasource NoCloud.
- Générer des images ISO contenant les configurations Cloud-Init.
- Créer et personnaliser une image Ubuntu de base.
- Déployer plusieurs machines virtuelles à partir d'une image template.
- Automatiser la génération des configurations avec Python et Jinja2.
- Vérifier et diagnostiquer l'exécution de Cloud-Init.

## Environnement technique

| Outil | Utilisation |
|---|---|
| Ubuntu | Système hôte |
| KVM/QEMU | Virtualisation |
| libvirt | Gestion des machines virtuelles |
| Cloud-Init | Configuration automatique |
| NoCloud | Source des données Cloud-Init |
| YAML | Fichiers de configuration |
| Python | Automatisation |
| Jinja2 | Génération des templates |
| Git / GitHub | Gestion du projet |

## Organisation du projet

```text
TP2/
├── images/
│   └── README.md
├── cloud-init/
│   ├── user-data.yml
│   ├── meta-data.yml
│   └── network-config.yml
├── profils/
│   ├── web.yml
│   ├── db.yml
│   └── admin.yml
├── templates/
│   ├── user-data.j2
│   └── network-config.j2
├── inventaire/
│   └── vms.yml
├── scripts/
│   ├── generateur.py
│   └── deploy.py
├── output/
│   ├── vm-web/
│   ├── vm-db/
│   └── vm-admin/
└── README.md
```

## Profils des machines virtuelles

Trois profils sont prévus :

- **Web :** installation du serveur web Nginx.
- **Database :** installation du système de gestion de bases de données PostgreSQL.
- **Admin :** installation des outils d'administration (htop, curl et vim).

## Automatisation

Les templates Jinja2 et les scripts Python permettent de générer automatiquement les fichiers de configuration pour chaque machine virtuelle à partir de son profil et de l'inventaire.

Les configurations générées sont ensuite utilisées pour préparer les supports NoCloud et déployer les machines virtuelles.

## Vérification et diagnostic

Les commandes Cloud-Init permettent notamment de :

- Vérifier l'état d'exécution de Cloud-Init.
- Consulter les journaux d'exécution.
- Analyser les étapes d'initialisation.
- Valider la syntaxe des fichiers YAML.

## Résultats attendus

À la fin du TP, trois machines virtuelles distinctes sont déployées avec des configurations adaptées à leurs rôles : Web, Database et Administration.

## Auteur

**Master BD2C – 2ème année**  
Faculté des Sciences Aïn Chock (FSAC)  
Université Hassan II de Casablanca  
Année universitaire : 2026–2027