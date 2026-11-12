

set -e

SOURCE_DISK="/var/lib/libvirt/images/srv-source.qcow2"
TEMPLATE_DIR="/var/lib/libvirt/images/templates"
TEMPLATE_DISK="${TEMPLATE_DIR}/ubuntu-template.qcow2"

echo "=== Preparation du template Ubuntu ==="

# Verification du disque source
if [ ! -f "$SOURCE_DISK" ]; then
    echo "Erreur : disque source introuvable."
    exit 1
fi

# Verification de l'arret de la VM
STATE=$(sudo virsh domstate srv-source)

if [ "$STATE" != "shut off" ]; then
    echo "Erreur : arretez srv-source avant de creer le template."
    exit 1
fi

# Creation du dossier des templates
sudo mkdir -p "$TEMPLATE_DIR"

# Verification de l'existence du template
if [ -f "$TEMPLATE_DISK" ]; then
    echo "Erreur : le template existe deja."
    exit 1
fi

# Preparation du disque avec virt-sysprep
sudo virt-sysprep -a "$SOURCE_DISK"

# Copie du disque source
sudo qemu-img convert \
    -f qcow2 \
    -O qcow2 \
    "$SOURCE_DISK" \
    "$TEMPLATE_DISK"

echo "=== Template cree avec succes ==="
echo "$TEMPLATE_DISK"
