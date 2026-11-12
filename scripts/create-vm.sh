

set -e

# Configuration de la VM
VM="srv-source"
RAM=2048
CPU=2
DISK="/var/lib/libvirt/images/${VM}.qcow2"
ISO="/var/lib/libvirt/boot/ubuntu.iso"
OSVAR="ubuntu24.04"

echo "=== Creation de la VM ${VM} ==="

# Verification de l'ISO
if [ ! -f "$ISO" ]; then
    echo "Erreur : fichier ISO introuvable : $ISO"
    exit 1
fi

# Verification de l'existence de la VM
if sudo virsh dominfo "$VM" >/dev/null 2>&1; then
    echo "Erreur : la VM ${VM} existe deja."
    exit 1
fi

# Verification du disque
if [ -f "$DISK" ]; then
    echo "Erreur : le disque existe deja : $DISK"
    exit 1
fi

# Activation du reseau NAT
sudo virsh net-start default 2>/dev/null || true
sudo virsh net-autostart default

# Creation de la machine virtuelle
sudo virt-install \
    --name "$VM" \
    --memory "$RAM" \
    --vcpus "$CPU" \
    --disk path="$DISK",size=15,format=qcow2,bus=virtio \
    --cdrom "$ISO" \
    --os-variant "$OSVAR" \
    --network network=default,model=virtio \
    --graphics vnc,listen=127.0.0.1 \
    --noautoconsole

echo "=== Creation terminee ==="
echo "VM : $VM"
