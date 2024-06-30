#!/bin/bash

while true; do
    echo "Select an operation to perform:"
    echo "1. Install Core Network"
    echo "2. Install gNB to UE (Single)"
    echo "3. Install gNB to UE (MDU)"
    echo "4. Install gNB to UE (MUE)"
    echo "5. Upgrade Core Network"
    echo "6. Upgrade gNB to UE (Single)"
    echo "7. Upgrade gNB to UE (MDU)"
    echo "8. Upgrade gNB to UE (MUE)"
    echo "9. Uninstall Core Network"
    echo "10. Uninstall gNB to UE (Single)"
    echo "11. Uninstall gNB to UE (MDU)"
    echo "12. Uninstall gNB to UE (MUE)"
    echo "13. Exit"
    read -p "Enter your choice (1-13): " choice

    case $choice in
        1)
            helm install basic /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/oai-5g-core/oai-5g-basic/ -n core-network
            echo "Core network installed."
            echo
            ;;
        2)
            # Install gNB to UE (Single)
            helm install oai-cu-level1 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-cu/ -n user-n
            helm install oai-du-level1 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-du/ -n user-n
            helm install oai-nr-ue-level1 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-nr-ue/ -n user-n
            echo "gNB to UE (Single) installed."
            echo
            ;;
        3)
            # Install gNB to UE (MDU)
            helm install oai-cu-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-cu/ -n user-n
            helm install oai-du1-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-du-1/ -n user-n
            helm install oai-du2-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-du-2/ -n user-n
            helm install oai-nr-ue1-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-nr-ue-1/ -n user-n
            helm install oai-nr-ue2-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-nr-ue-2/ -n user-n
            echo "gNB to UE (MDU) installed."
            echo
            ;;
        4)
            # Install gNB to UE (MUE)
            helm install oai-cu-level3 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-ue/oai-cu/ -n user-n
            helm install oai-du-level3 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-ue/oai-du/ -n user-n
            helm install oai-nr-ue1-level3 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-ue/oai-nr-ue-1/ -n user-n
            # helm install oai-nr-ue2-level3 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-ue/oai-nr-ue-2/ -n user-n
            echo "gNB to UE (MUE) installed."
            echo
            ;;
        5)
            # Upgrade Core Network
            helm upgrade basic /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/oai-5g-core/oai-5g-basic/ -n core-network
            echo "Core network upgraded."
            echo
            ;;
        6)
            # Upgrade gNB to UE (Single)
            helm upgrade oai-cu-level1 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-cu/ -n user-n
            helm upgrade oai-du-level1 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-du/ -n user-n
            helm upgrade oai-nr-ue-level1 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-nr-ue/ -n user-n
            echo "gNB to UE (Single) upgraded."
            echo
            ;;
        7)
            # Upgrade gNB to UE (MDU)
            helm upgrade oai-cu-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-cu/ -n user-n
            helm upgrade oai-du1-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-du-1/ -n user-n
            helm upgrade oai-du2-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-du-2/ -n user-n
            helm upgrade oai-nr-ue1-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-nr-ue-1/ -n user-n
            helm upgrade oai-nr-ue2-level2 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-gnb/oai-nr-ue-2/ -n user-n
            echo "gNB to UE (MDU) upgraded."
            echo
            ;;
        8)
            # Upgrade gNB to UE (MUE)
            helm upgrade oai-cu-level3 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-ue/oai-cu/ -n user-n
            helm upgrade oai-du-level3 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-ue/oai-du/ -n user-n
            helm upgrade oai-nr-ue1-level3 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-ue/oai-nr-ue-1/ -n user-n
            # helm upgrade oai-nr-ue2-level3 /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-multi-ue/oai-nr-ue-2/ -n user-n
            echo "gNB to UE (MUE) upgraded."
            echo
            ;;
        9)
            # Uninstall Core Network
            helm uninstall basic -n core-network
            echo "Core network uninstalled."
            echo
            ;;
        10)
            # Uninstall gNB to UE (Single)
            helm uninstall oai-cu-level1 -n user-n
            helm uninstall oai-du-level1 -n user-n
            helm uninstall oai-nr-ue-level1 -n user-n
            echo "gNB to UE (Single) uninstalled."
            echo
            ;;
        11)
            # Uninstall gNB to UE (MDU)
            helm uninstall oai-cu-level2 -n user-n
            helm uninstall oai-du1-level2 -n user-n
            helm uninstall oai-du2-level2 -n user-n
            helm uninstall oai-nr-ue1-level2 -n user-n
            helm uninstall oai-nr-ue2-level2 -n user-n
            echo "gNB to UE (MDU) uninstalled."
            echo
            ;;
        12)
            # Uninstall gNB to UE (MUE)
            helm uninstall oai-cu-level3 -n user-n
            helm uninstall oai-du-level3 -n user-n
            helm uninstall oai-nr-ue1-level3 -n user-n
            # helm uninstall oai-nr-ue2-level3 -n user-n
            echo "gNB to UE (MUE) uninstalled."
            echo
            ;;
        13)
            echo "Exiting..."
            echo
            break
            ;;
        *)
            echo "Invalid option, please try again."
            echo
            ;;
    esac
done
