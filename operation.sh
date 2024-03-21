#!/bin/bash

echo "Do you want to install the core network? (yes/no)"
read install_core

if [ "$install_core" == "yes" ]; then
    # Install Core
    helm install basic /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/oai-5g-core/oai-5g-basic/ -n core-network
 
    echo "Core network installed."
else
    echo "Skipping core network installation."
fi

echo "Do you want to install gNB to UE? (yes/no)"
read install_gnb_ue

if [ "$install_gnb_ue" == "yes" ]; then
    # Install gNB to UE
    helm install oai-cu-user-n /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-cu/ -n user-n
    helm install oai-du-user-n /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-du/ -n user-n
    helm install oai-nr-ue-user-n /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-nr-ue/ -n user-n
    echo "gNB to UE installed."
else
    echo "Skipping gNB to UE installation."
fi

echo "Do you want to upgrade the core network? (yes/no)"
read upgrade_core

if [ "$upgrade_core" == "yes" ]; then
    # Upgrade Core
    helm upgrade basic /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/oai-5g-core/ -n core-network
    echo "Core network upgraded."
else
    echo "Skipping core network upgrade."
fi

echo "Do you want to upgrade gNB to UE? (yes/no)"
read upgrade_gnb_ue

if [ "$upgrade_gnb_ue" == "yes" ]; then
    # Upgrade gNB to UE
    helm upgrade oai-cu-user-n /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-cu/ -n user-n
    helm upgrade oai-du-user-n /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-du/ -n user-n
    helm upgrade oai-nr-ue-user-n /home/rafli/vnf-netra/AN-OPEN-NETRA-VNF/user_n/oai-e2e/oai-nr-ue/ -n user-n
    echo "gNB to UE upgraded."
else
    echo "Skipping gNB to UE upgrade."
fi

echo "Do you want to uninstall the core network? (yes/no)"
read uninstall_core

if [ "$uninstall_core" == "yes" ]; then
    # Uninstall Core
    helm uninstall basic -n core-network
    echo "Core network uninstalled."
else
    echo "Skipping core network uninstallation."
fi

echo "Do you want to uninstall gNB to UE? (yes/no)"
read uninstall_gnb_ue

if [ "$uninstall_gnb_ue" == "yes" ]; then
    # Uninstall gNB to UE
    helm uninstall oai-cu-user-n -n user-n
    helm uninstall oai-du-user-n -n user-n
    helm uninstall oai-nr-ue-user-n -n user-n
    echo "gNB to UE uninstalled."
else
    echo "Skipping gNB to UE uninstallation."
fi

