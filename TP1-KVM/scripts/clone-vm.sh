


set -e

# Configuration
SOURCE_VM="srv-source"
CLONE_VM="srv-clone"
CLONE_DISK="/var/lib/libvirt/images/${CLONE_VM}.qcow2"

echo "=== Clonage de ${SOURCE_VM} ==="

# Verification de la VM source
if ! sudo virsh dominfo "$SOURCE_VM" >/dev/null 2>&1; then
    echo "Erreur : la VM source n'existe pas."
    exit 1
fi

# Verification de la VM clonee
if sudo virsh dominfo "$CLONE_VM" >/dev/null 2>&1; then
    echo "Erreur : la VM clonee existe deja."
    exit 1
fi

# Clonage
sudo virt-clone \
    --original "$SOURCE_VM" \
    --name "$CLONE_VM" \
    --file "$CLONE_DISK"

echo "=== Clonage termine ==="
echo "Nouvelle VM : $CLONE_VM"
echo "Disque : $CLONE_DISK"
