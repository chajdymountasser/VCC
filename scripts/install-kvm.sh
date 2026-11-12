

set -e

echo "=== Mise a jour du systeme ==="
sudo apt update

echo "=== Installation des outils de virtualisation ==="
sudo apt install -y \
    qemu-kvm \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virtinst \
    virt-manager \
    ovmf

echo "=== Activation du service libvirt ==="
sudo systemctl enable --now libvirtd

echo "=== Ajout de l'utilisateur aux groupes ==="
USER_NAME="${SUDO_USER:-$USER}"
sudo usermod -aG libvirt,kvm "$USER_NAME"

echo "=== Verification de KVM ==="
virsh --version

echo "=== Installation terminee ==="
echo "Reconnectez-vous pour appliquer les nouveaux groupes."
