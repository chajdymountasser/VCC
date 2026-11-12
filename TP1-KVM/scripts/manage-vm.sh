


set -e

echo "=================================="
echo "       GESTION DES MACHINES"
echo "=================================="

echo "1. Afficher les machines virtuelles"
echo "2. Demarrer une machine virtuelle"
echo "3. Arreter une machine virtuelle"
echo "4. Redemarrer une machine virtuelle"
echo "5. Afficher l'etat d'une machine"
echo "6. Quitter"

read -p "Choisissez une operation : " choix

case "$choix" in

    1)
        sudo virsh list --all
        ;;

    2)
        read -p "Nom de la VM : " VM
        sudo virsh start "$VM"
        ;;

    3)
        read -p "Nom de la VM : " VM
        sudo virsh shutdown "$VM"
        ;;

    4)
        read -p "Nom de la VM : " VM
        sudo virsh reboot "$VM"
        ;;

    5)
        read -p "Nom de la VM : " VM
        sudo virsh domstate "$VM"
        ;;

    6)
        echo "Fin du programme."
        exit 0
        ;;

    *)
        echo "Choix invalide."
        exit 1
        ;;
esac
