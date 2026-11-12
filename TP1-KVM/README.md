# TP1 – Virtualisation avec KVM, QEMU et libvirt

## 1. Présentation du projet

Ce TP consiste à mettre en place un environnement de virtualisation sous Ubuntu en utilisant KVM, QEMU et libvirt.

Il permet de découvrir les différentes opérations de gestion des machines virtuelles, notamment l'installation de l'environnement, la création, le clonage, la création de templates et l'administration des VM.

## 2. Objectifs du TP

- Installer et configurer KVM, QEMU et libvirt.
- Créer des machines virtuelles Ubuntu.
- Cloner une machine virtuelle existante.
- Créer et utiliser un template réutilisable.
- Gérer les machines virtuelles avec `virsh`.
- Automatiser les opérations à l'aide de scripts Bash.

## 3. Environnement technique

| Composant | Technologie |
|---|---|
| Système hôte | Ubuntu |
| Hyperviseur | KVM |
| Émulateur | QEMU |
| Gestion des VM | libvirt |
| Interface graphique | virt-manager |
| Langage | Bash |
| Format des disques | QCOW2 |
| Réseau | NAT (libvirt) |

## 4. Structure du projet

```text
TP1-KVM/
│
├── images/
│   ├── ubuntu-vm01.qcow2
│   └── ubuntu-vm02.qcow2
│
├── scripts/
│   ├── clone-vm.sh
│   ├── create-template.sh
│   ├── create-vm.sh
│   ├── install-kvm.sh
│   └── manage-vm.sh
│
├── templates/
│   └── ubuntu-template.qcow2
│
└── README.md
```

## 5. Description des dossiers

### images/

Contient les images disque des machines virtuelles au format QCOW2.

- `ubuntu-vm01.qcow2` : disque virtuel de la première VM.
- `ubuntu-vm02.qcow2` : disque virtuel de la deuxième VM.

### scripts/

Contient les scripts Bash permettant d'automatiser les opérations de virtualisation.

| Script | Description |
|---|---|
| `install-kvm.sh` | Installation et configuration de KVM/QEMU/libvirt. |
| `create-vm.sh` | Création d'une machine virtuelle. |
| `clone-vm.sh` | Clonage d'une machine virtuelle existante. |
| `create-template.sh` | Préparation d'un template réutilisable. |
| `manage-vm.sh` | Gestion des machines virtuelles. |

### templates/

Contient les images modèles utilisées pour créer de nouvelles machines virtuelles.

- `ubuntu-template.qcow2` : image template Ubuntu au format QCOW2.

## 6. Commandes principales de KVM/libvirt

### 6.1. Informations sur les machines virtuelles

Afficher toutes les machines virtuelles :

```bash
virsh list --all
```

Afficher uniquement les machines en cours d'exécution :

```bash
virsh list
```

Afficher les informations d'une VM :

```bash
virsh dominfo NOM_VM
```

Afficher l'état d'une VM :

```bash
virsh domstate NOM_VM
```

### 6.2. Gestion des machines virtuelles

Démarrer une VM :

```bash
virsh start NOM_VM
```

Arrêter proprement une VM :

```bash
virsh shutdown NOM_VM
```

Forcer l'arrêt d'une VM :

```bash
virsh destroy NOM_VM
```

Redémarrer une VM :

```bash
virsh reboot NOM_VM
```

Suspendre une VM :

```bash
virsh suspend NOM_VM
```

Reprendre une VM suspendue :

```bash
virsh resume NOM_VM
```

### 6.3. Gestion des disques virtuels

Afficher les disques associés à une VM :

```bash
virsh domblklist NOM_VM
```

Afficher les informations d'une image QCOW2 :

```bash
qemu-img info chemin/vers/image.qcow2
```

Créer une image disque QCOW2 :

```bash
qemu-img create -f qcow2 disque.qcow2 15G
```

### 6.4. Gestion des réseaux virtuels

Afficher les réseaux virtuels :

```bash
virsh net-list --all
```

Démarrer un réseau :

```bash
virsh net-start NOM_RESEAU
```

Arrêter un réseau :

```bash
virsh net-destroy NOM_RESEAU
```

Activer le démarrage automatique d'un réseau :

```bash
virsh net-autostart NOM_RESEAU
```

### 6.5. Clonage et création de machines virtuelles

Créer une VM :

```bash
virt-install [options]
```

Cloner une VM :

```bash
virt-clone --original VM_SOURCE --name VM_CLONE --file DISQUE_CLONE.qcow2
```

### 6.6. Gestion des templates

Préparer une image système :

```bash
virt-sysprep -a image.qcow2
```

Copier une image disque :

```bash
qemu-img convert -f qcow2 -O qcow2 source.qcow2 destination.qcow2
```



## 7. Exécution des scripts

Rendre les scripts exécutables :

```bash
chmod +x scripts/*.sh
```

Exemple d'exécution :

```bash
./scripts/manage-vm.sh
```

\
## 8. Conclusion

Ce TP nous a permis de mettre en pratique les concepts fondamentaux de la virtualisation avec KVM, QEMU et libvirt.

Nous avons étudié la création, le clonage et la gestion des machines virtuelles ainsi que l'utilisation des images QCOW2 et des templates.

L'automatisation avec Bash permet de simplifier les opérations et de rendre l'environnement de virtualisation plus facile à administrer.

---

**Module :** Virtualisation et Cloud Computing  
**Travail pratique :** TP1 – KVM / QEMU / libvirt